const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');

const app = express();
const port = 3000;

app.use(bodyParser.json());

mongoose.connect('mongodb+srv://quantran:sk02LtmoXptDzaf1@rapid.q38sl.mongodb.net/?retryWrites=true&w=majority&appName=rapid');
const db = mongoose.connection;
db.on('error', (error) => console.error(error));
db.once('open', () => console.log('Connected to Database'));




app.post('/', (req, res) => {
  const { name , age, email } = req.body
  const newUser = new User({ name: name , age: age, email: email });
  newUser.save();
  res.json('api is working')
});

//lấy dữ liệu người dùng
app.get('/', async (req, res) => {
  const user = await User.find();
  res.json(user)
});

//update user by id
app.put('/:id',async (req, res) => {
  const id = req.params.id;
  await User.findByIdAndUpdate(id, { $set: {name:"tranquan",age:21} }, { new: true });
  res.json("Update successfully")
});
//delete user by id
app.delete('/:id', async (req, res) =>{
  const id = req.params.id;
  await User.findByIdAndDelete(id);
  res.json('Delete successfully')
})

app.listen(port, () =>{
  console.log('Sever is running on : ',+ port);
});



const { Schema, model } = mongoose;
const userSchema = new Schema({
 name: String,
 age: Number,
 email: String
});
const User = model('User', userSchema);

