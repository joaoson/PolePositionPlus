<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./signupstyle.css">
    <title>Sign up - PPP</title>
</head>
<body>
    <main>
        <div class="photoCover">
        <div class="mainTitle">
            <h1>
                <div>
                    P
                </div>
                <div>
                    P
                </div>
                <div>
                    P
                </div>
            </h1>
        </div>
        </div>
        <div class="mainContainer">
            <div class="header">
                <h1 id="welcome">Welcome to the sign up page of PPP</h1>
                <p>Already have an account? <a href="login.php">Login</a></p>
            </div>
            <form method="POST" action="signup_php.php" class="formulario">
                <div class="inputs">
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name">
                </div>
                <div class="inputs">
                    <label for="surname">Surname</label>
                    <input type="text" name="surname" id="surname">
                    
                </div>
                <div class="inputs">
                    <label for="birth">Date of Birth</label>
                    <input type="date" name="birth" id="birth">

                </div>
                <div class="inputs">
                    <label for="telephone">Telephone</label>
                    <input type="number" name="telephone" id="telephone">

                </div>
                <div class="inputs">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email">

                </div>
                <div class="inputs">
                     <label for="">Password</label>
                     <input type="password" name="password" id="password">
                </div>

                <div class="checkbox">
                     <input id="checkbox1" type="checkbox" name="checkbox">
                     <label id="checkBoxLabel" for="checkbox1">I agree to the Terms, Privacy Policy and Fees.</label>
                </div>

                <button id="submit" type="submit">Sign up</button>

            </form>
        </div>
    </main>
</body>
</html>