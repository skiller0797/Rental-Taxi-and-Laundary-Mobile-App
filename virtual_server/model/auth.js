const mongoose = require('mongoose');
const bcyrpt = require('bcrypt');
const { authenticate } = require('passport');

const userSchema = new mongoose.Schema({
    firstName: {
        type: String,
        require: true,
        trim: true,
        min: 3,
        max: 20
    },
    lastName: {
        type: String,
        require: true,
        trim: true,
        min: 3,
        max: 20
    },
    username: {
        type: String,
        require: true,
        trim: true,
        unique: true,
        lowercase: true,
        index: true
    },
    email: {
        type: String,
        require: true,
        trim: true,
        unique: true,
        lowercase: true
    },
    role: {
        type: String,
        enum:['user', 'admin'],
        default: 'user'
    },
    contactNumber: {
        type: String
    },
    profilePicture: {
        type: String
    },
},{timestamps: true});

//for get fullname from when we get data from database
userSchema.virtual('fullName').get(function(){
    return `${this.firstName}${this.lastName}`;
})

userSchema.method({
    async authenticate(password){
        return bcyrpt.compare(password, this.hash_password);
    }
});

module.exports = mongoose.model('User', userSchema);