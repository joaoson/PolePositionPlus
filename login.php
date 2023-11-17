<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./loginstyle.css">
    <title>Login - PPP</title>
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
                <h1 id="welcome">Welcome to the Login page of PPP</h1>
                <p>Do not have an account? <a href="signup.php">Sign-up</a></p>
            </div>
            <form method="POST" action="login_php.php" class="formulario">
                <div class="inputs">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email">

                </div>
                <div class="inputs">
                     <label for="">Password</label>
                     <input type="password" name="password" id="password">
                </div>

                <button id="submit" type="submit">Login</button>

            </form>
        </div>
    </main>
</body>
</html>