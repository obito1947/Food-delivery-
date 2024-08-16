document.getElementById('registration-form').addEventListener('submit', function(event) {
    event.preventDefault();
    
    // Clear previous error messages
    clearErrors();
    
    // Get form values
    const name = document.getElementById('name').value.trim();
    const username = document.getElementById('username').value.trim();
    const email = document.getElementById('email').value.trim();
    const mobile = document.getElementById('mobile').value.trim();
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirm-password').value;
    const securityQuestion = document.getElementById('security-question').value;
    
    let isValid = true;
    
    // Validate name
    if (name === '') {
        showError('name', 'Name is required.');
        isValid = false;
    }
    
    // Validate username
    if (username === '') {
        showError('username', 'Username is required.');
        isValid = false;
    }
    
    // Validate email
    if (email === '' || !validateEmail(email)) {
        showError('email', 'Valid Email ID is required.');
        isValid = false;
    }
    
    // Validate mobile number
    if (mobile === '' || !validateMobile(mobile)) {
        showError('mobile', 'Valid Mobile Number is required.');
        isValid = false;
    }
    
    // Validate password
    if (password.length < 6) {
        showError('password', 'Password must be at least 6 characters long.');
        isValid = false;
    }
    
    // Validate confirm password
    if (password !== confirmPassword) {
        showError('confirm-password', 'Passwords do not match.');
        isValid = false;
    }
    
    // Validate security question
    if (securityQuestion === '') {
        showError('security-question', 'Security Question is required.');
        isValid = false;
    }

     // Validate security answer
     if (securityQuestion !== '' && securityAnswer === '') {
        showError('security-answer', 'Answer is required.');
        isValid = false;
    }
    
    if (isValid) {
        document.getElementById('success-message').textContent = 'Registration successful!';
    }
});

function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

function validateMobile(mobile) {
    const re = /^[0-9]{10}$/; // Assumes a 10-digit mobile number
    return re.test(mobile);
}

function showError(id, message) {
    document.getElementById(id + '-error').textContent = message;
}

function clearErrors() {
    const errors = document.querySelectorAll('.error-message');
    errors.forEach(error => error.textContent = '');
    document.getElementById('success-message').textContent = '';
}
document.addEventListener('DOMContentLoaded', () => {
    const labels = document.querySelectorAll('.label');
    const selection = document.querySelector('.selection');

    labels.forEach(label => {
        const input = label.querySelector('.input');
        input.addEventListener('change', () => {
            if (input.checked) {
                updateSelectionColor(label);
            }
        });
    });

    function updateSelectionColor(selectedLabel) {
        switch (selectedLabel.querySelector('span').textContent) {
            case 'Male':
                selection.style.backgroundColor = '#483D8B';
                break;
            case 'Female':
                selection.style.backgroundColor = 'pink';
                break;
            case 'Others':
                selection.style.backgroundColor = 'darkgray';
                break;
            default:
                selection.style.backgroundColor = 'gray'; // fallback color
        }
    }
});