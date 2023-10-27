const express = require('express');
const router = express.Router();

const {singUp, singIn} = require('../controller/auth');
const {
    isRequestValidated,
    validateSignUpRequest,
    validateSigninRequest
} = require('../validator/auth');

// router.route('signin').post(validateSigninRequest, isRequestValidated, singIn);

// router.route('signup').post(validateSignUpRequest, isRequestValidated, singUp);

module.exports = router;