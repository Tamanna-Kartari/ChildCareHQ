<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Book Appointment</title>
    <link rel="stylesheet" href="styles.css">
</head>

<style>
    body {
   font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-image: url(https://www.roswellpark.org/sites/default/files/2020-10/adobestock_257046917.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;

}

header {
    background-color: #333;
    color: #fff;
    padding: 20px;
    text-align: center;
}

h1 {
    margin: 0;
}

.appointment-container {
    max-width: 600px;
    margin: 50px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

.appointment-title {
    margin: 0;
    color: #333;
    text-align: center;
}

.appointment-form {
    margin-top: 20px;
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    margin-bottom: 5px;
    color: #666;
}

input[type="text"],
input[type="email"],


input[type="date"],
input[type="time"],
textarea {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 3px;
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    outline: none;
}

textarea {
    resize: none;
}

button[type="submit"] {
    background-color: #3261ef;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out;
}

button[type="submit"]:hover {
    background-color: #666;
}

</style>
<body>
<form action="./bookapp" method="post">
    <header>
        <h1>Book Appointment</h1>
    </header>
    <main>
    
        <div class="appointment-container">
            <h2 class="appointment-title">Schedule an Appointment</h2>
            <form action="./bookapp" class="appointment-form">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="<%=session.getAttribute("LoginUsername") %>" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<%=session.getAttribute("LoginEmail") %>" required>
                </div>
                <div class="form-group">
                    <label for="age">Age:</label>
                    <input type="text" id="age" name="age" "required>
                </div>
                <div class="form-group">
                    <label for="phone">phone:</label>
                    <input type="text" id="phone" name="phone" value="<%=session.getAttribute("LoginPhone") %>" required>
                </div>
                <div class="form-group">
                    <label for="date">Appointment Date:</label>
                    <input type="date" id="date" name="date" required>
                </div>
                <div class="form-group">
                    <label for="time">Time:</label>
                    <input type="time" id="time" name="time" required>
                </div>
                <div class="form-group">
                    <label for="doc">Doctor:</label>
                    <input type="text" id="doc" name="doctor" required>
                </div>
                <div class="form-group">
                    <label for="message">Message:</label>
                    <textarea id="message" name="message" rows="4"></textarea>
                </div>
                <div class="form-group">
                    <button type="submit">Submit</button>
                </div>
            </form>
        </div>
    </main>
</form>    
</body>
</html>