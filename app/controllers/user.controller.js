import bcrypt from "bcrypt";
import createdUserSchema from "../validations/schemas/created.schema.user.js";
import updatedUserSchema from "../validations/schemas/updated.schema.user.js";
import userDatamapper from "../datamappers/user.datamapper.js";

export default {

  async getUsers(req, res) {
    try{
      const users = await userDatamapper.getUsers();
      if(users.length == 0){
        return res.status(404).json({error: '/users not found.'});
      }
      res.status(200).json(users);
    }
    catch(error){
      console.error(error);
      res.status(500).json({error: '500 Internal Server Error'});
    }
  },
  
  
  async getUser(req, res) {
      const id = req.params.id
    try{
      const userId = Number.parseInt(req.params.id, 10);
          if(isNaN(userId)){
          return res.status(400).json({error: 'User ID should be a valid integer'});
          };
      const user = await userDatamapper.getUserById(id)
      if(user.length == 0){
        return res.status(404).json({error: 'User not found. Please verify the provided id.'});
      }
      res.status(200).json(user);
    }
    catch(error){
      console.error(error);
      res.status(500).json({error: '500 Internal Server Error'});
    }
  },
  
  async createdUser(req,res){
          
      try{
          const createUserSchema = createdUserSchema;
        
          const { error } = createUserSchema.validate(req.body);
          if (error) { return res.status(400).json({ error: error.message }); }
        
          if (req.body.password !== req.body.passwordConfirm) {
            return res.status(400).json({error: 'Passwords do not match'});
          }
          
          const email = req.body.email;
          const username = req.body.username;

          const existingUserByUsername = await userDatamapper.getUserByUsername(username);
          const existingUserByEmail = await userDatamapper.getUserByEmail(email);
          
          if (existingUserByEmail.length != 0 || existingUserByUsername.length != 0) {

            return res.status(400).json({error: 'Email or username is already in use'});
          }
          const hashedPassword = await bcrypt.hash(req.body.password, 10);
      
          const createdUser = await userDatamapper.createdUser({
            username: req.body.username,
            email: req.body.email,
            password: hashedPassword, 
            firstname: req.body.firstname,
            lastname: req.body.lastname,
            address: req.body.address, 
            role: "registered",
          });
          res.status(201).json(createdUser);
        }
        catch(error){
          console.error(error);
          res.status(500).json({error: '500 Internal Server Error'});
        }
  
  },
  
  
   async updatedUser(req, res) {
      const id = req.params.id;
    try{
      const userId = Number.parseInt(req.params.id, 10);
          if(isNaN(userId)){
          return res.status(400).json({error: 'User ID should be a valid integer'});
          };
      const user = await userDatamapper.getUserById(id);
      if(user.length == 0){
          return res.status(400).json({error: 'User not found. Please verify the provided id.'});
      }
    
      const updateUserSchema = updatedUserSchema;
    
      const { error } = updateUserSchema.validate(req.body);
      if (error) { return res.status(400).json({ error: error.message }); }
    
      if (req.body.password !== req.body.passwordConfirm) {
        return res.status(400).json({error: 'Passwords do not match'});
      }
  
          
      const existingUserById = await userDatamapper.getUserById(id);
          
      const isValidPassword = await bcrypt.compare(
        req.body.password,
        existingUserById[0].password
      );
  
      if(isValidPassword) {
        return res.status(400).json({error: 'Password is already in use'});
      }
      const hashedPassword = await bcrypt.hash(req.body.password, 10);
  
      const updatedUser = await userDatamapper.updatedUser({
        username: req.body.username,
        email: req.body.email,
        password: hashedPassword, 
        firstname: req.body.firstname,
        lastname: req.body.lastname,
        address: req.body.address, 
        role: req.body.role || '',
        id: id
      });

      res.status(200).json(updatedUser);
    }
    catch(error){
      console.error(error);
      res.status(500).json({error: '500 Internal Server Error'});
    }
  },
  
  
  async deletedUser(req, res) {
      const id = req.params.id;
      try {
          const userId = Number.parseInt(req.params.id, 10);
          if(isNaN(userId)){
          return res.status(400).json({error: 'User ID should be a valid integer'});
          };
  
          const user = await userDatamapper.getUserById(id);
  
          if(user.length == 0){
              return res.status(400).json({error: 'User not found. Please verify the provided id.'});
          }
  
          const deletedUser = await userDatamapper.deleteUser(id);
  
          if(deletedUser) {
              return res.status(200).json({message: `The user number ' ${user[0].id} ' is deleted`});
          }
          else {
              return res.status(404).json({error: 'Whoops! \n 404'});
          }
      }
      catch(err) {
          console.trace(err);
          res.status(500).json({error: '500 Internal Server Error'});
      }
  }
}
