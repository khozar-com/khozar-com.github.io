async function sendEmail() {
    var name = document.getElementById('nameField').value;
    var phoneNumber = document.getElementById('numberField').value;
    var email = document.getElementById('emailField').value;
    var date = document.getElementById('dateField').value;

    if(validation(name, phoneNumber, email, date) === false)
        return;

    

    var sendMailRequest = processRequest(name, phoneNumber, email, date);
    var response = postJson("https://sjekhiaq56.execute-api.af-south-1.amazonaws.com/production/sendmail/v1", sendMailRequest, true);
    processResponse(response);
}

var captchaSuccess = function () {
    var captchaResponse = grecaptcha.getResponse();

    if(captchaResponse.length == 0) {
            document.getElementById('captcha').innerHTML="You can't leave Captcha Code empty";
            return false;
    } else {
            document.getElementById('captcha').innerHTML="Captcha completed";
            return true; 
    }
}


var validation = function (name, phoneNumber, email, date) {
    var isValid = true;
    if (name === null || name.length === 0) {
        isValid = false;
    } else if (phoneNumber === null || phoneNumber.length === 0) {
        isValid = false;
    } else if (email === null || email.length === 0) {
        isValid = false;
    } else if (date === null || date.length === 0) {
        isValid = false;
    }

    if(isValid === false) {
        //Invoke native html validation prompts
        let introForm = document.getElementById('intro_form');
        let contactForm = document.getElementById('contact_form');
        if(introForm)
            introForm.reportValidity();
        if(contactForm)
            contactForm.reportValidity();
    }

    if(captchaSuccess() == false) {
        isValid = false;
    }

    console.log()

    return isValid;
}

var processRequest = function (name, phoneNumber, email, date) {
    var sendMailRequest = {};
    sendMailRequest.fromEmail = name + " <noreplyemailaddressserver@gmail.com>";
    sendMailRequest.subject = "Appointment booked on quickcaresurgery.co.za";
    sendMailRequest.toEmail = "matipa.modisane@gmail.com";
    sendMailRequest.bodyHtml = "<p1>Patient details</p1><br/><p1>Name: " + name + "</p1> <br/> <p1>Email: " + email + "</p1> <br/> <p1>Cell number: " + phoneNumber + "</p1> <br/> <p1>Appointment date: " + date + "</p1>"
    return sendMailRequest;
}

var postJson = function(url, body, isAsync) {
    var request = new XMLHttpRequest();
    request.open("POST", url, isAsync);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(body));
    return request;
}

var processResponse = function(request) {
    request.onreadystatechange = function() {
        if (request.readyState === XMLHttpRequest.DONE) {
            var response = JSON.parse(request.responseText);
            if(response.responseCode === 200) {
                document.getElementById('nameField').value = "";
                document.getElementById('numberField').value = "";
                document.getElementById('emailField').value = "";
                document.getElementById('dateField').value = "";
                alert("Appointment successfully sent")
            } else {
                alert("Appointment unsuccessfully sent. Please try again.")
            }
        }
    }
}
