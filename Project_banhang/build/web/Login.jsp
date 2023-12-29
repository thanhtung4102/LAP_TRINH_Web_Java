<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="en">

<head>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Login Form</title>
    </head>
    <style>
        body {
            background:whitesmoke;
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
        }

        #logreg-forms {
            width: 100%;
            max-width: 360px;
            margin: 10% auto;
        }

        .form-signin,
        .form-signup {
            width: 100%;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background: #fff;
            margin-bottom: 20px;
            animation: fadeIn 0.5s ease-in-out;
        }

        h1 {
            font-size: 24px;
            color: #333;
            text-align: center;
        }

        p {
            text-align: center;
            margin-bottom: 20px;
        }

        input {
            margin-bottom: 15px;
            border-radius: 3px;
            padding: 10px;
            box-sizing: border-box;
            width: 100%;
        }

        button {
            margin-top: 20px;
            padding: 10px;
            width: 100%;
            border: none;
            cursor: pointer;
            border-radius: 3px;
        }

        .form-check-label {
            color: #555;
        }

        .btn-success {
            background-color: #28a745;
            color: #fff;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        #cancel_signup,
        #cancel_reset {
            cursor: pointer;
            color: #007bff;
        }

        #cancel_signup:hover,
        #cancel_reset:hover {
            color: #0056b3;
        }

        /* Animation for form transition */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>

<body>
    <div id="logreg-forms">
        <form class="form-signin" action="login" method="post">
            <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign in</h1>
            <p class="text-danger">${mess}</p>
            <input name="user" type="text" id="inputEmail" class="form-control" placeholder="Username" required="" autofocus="">
            <input name="pass" type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
            <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Sign in</button>
            <hr>
            <button class="btn btn-primary btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> Sign up New Account</button>
        </form>

        <form action="signup" method="post" class="form-signup">
            <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign up</h1>
            <input name="user" type="text" id="user-name" class="form-control" placeholder="User name" required="" autofocus="">
            <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Password" required autofocus="">
            <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Repeat Password" required autofocus="">
            <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i> Sign Up</button>
            <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a>
        </form>
        <br>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script>
        function toggleResetPswd(e) {
            e.preventDefault();
            $('#logreg-forms .form-signin').toggle();
            $('#logreg-forms .form-reset').toggle();
        }

        function toggleSignUp(e) {
            e.preventDefault();
            $('#logreg-forms .form-signin').toggle();
            $('#logreg-forms .form-signup').toggle();
        }

        $(() => {
            $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
            $('#logreg-forms #cancel_reset').click(toggleResetPswd);
            $('#logreg-forms #btn-signup').click(toggleSignUp);
            $('#logreg-forms #cancel_signup').click(toggleSignUp);
        })
    </script>
</body>

</html>
