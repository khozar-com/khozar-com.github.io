async function sendEmail() {
    let name = document.getElementById('nameField').value;
    let phoneNumber = document.getElementById('numberField').value;
    let email = document.getElementById('emailField').value;
    let date = document.getElementById('dateField').value;

    if (name === null || name.length === 0) {
        return;
    } else if (phoneNumber === null || phoneNumber.length !== 10) {
        return;
    } else if (email === null || email.length === 0) {
        return;
    } else if (date === null || date.length === 0) {
        return;
    }

    let sendMailRequest = {};
    sendMailRequest.name = name;
    sendMailRequest.email = email;
    sendMailRequest.phoneNumber = phoneNumber;
    sendMailRequest.date = date;

    console.log(sendMailRequest);

}
