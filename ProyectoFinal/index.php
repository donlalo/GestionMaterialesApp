<!doctype html>
<html lang="en">
  <head>
    <title>Login</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/signin.css" >
  </head>
  <body>
    <div class="container">

    <!-- ERROR EN DATOS DE INGRESO-->
    <?php
    session_start();

    if(isset($_SESSION['error']))
    {
      $error = $_SESSION['error'];
      unset($_SESSION['error']);
      ?>
      <div class="alert alert-warning">
        <strong>Error!</strong><?= $error ?>
      </div>
      <?php
    }
    ?>
    <!-- -->
    <form class="form-signin" action="controller/indexController.php" method="post">
      <img class="mb-4" src="img/logo.png" alt="" width="310" height="180">
      <h1 class="h3 mb-3 font-weight-normal">Gestión De Materiales</h1>
      <label for="inputEmail" class="sr-only">Usuario</label>
      <input type="text" name="user" class="form-control" placeholder="Usuario" required autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" id="inputPassword" name="pass" class="form-control" placeholder="Password" required>
      <!--
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>
      </div>-->
      <button class="btn btn-lg btn-block" type="submit" name="login">Ingresar</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2018</p>
    </form>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>