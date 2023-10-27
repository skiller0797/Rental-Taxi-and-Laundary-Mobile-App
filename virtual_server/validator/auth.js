const {check, validationResult} = require('express-validator');
const {StatusCodes} = require('http-status-codes');

const validateSignUpRequest = [
    check('firstName').notEmpty().withMessage('First Name is required'),
    check('lastName').notEmpty().withMessage('Last Name is required'),
    check('email').isEmail().withMessage('Valid Email is required'),
    check('password').isLength({min:6}).withMessage('Password must be more than 6 characters at least'),
]

const validateSigninRequest = [
    check('email').isEmail().withMessage('Valid Email is required'),
    check('password').isLength({min:6}).withMessage('Password is required')
]

const isRequestValidated = (req, res, next) => {
    const errors = validationResults(req);

    if(errors.array().length > 0) {
        return res.staus(StatusCodes.BAD_REQUEST).json({error:errors.array()[0].msg});
    }

    next();
}

module.exports = {
    validateSignUpRequest,
    validateSigninRequest,
    isRequestValidated
}