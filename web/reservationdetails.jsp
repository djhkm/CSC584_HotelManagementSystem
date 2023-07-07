<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Booking</title>
        <link rel="stylesheet" href="./style.css"/>
        
        <!-- bootstrap stuff -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container-fluid text-center topNav">
            <div class="row">
                <div class="col-10">
                    logo goes here
                </div>
                <div class="col-2">

                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#loginModal">
                        LOGIN / SIGN UP
                    </button>

                    <div class="fs-5 mb-1 d-inline">
                    </div>

<!--                    <a href="login.jsp">
                        <button class="btn btn-primary">
                            LOGIN / SIGN UP
                        </button>
                    </a>-->
                </div>
            </div>
        </div>
        <div class="container">
  <div class="card">
    <div class="card-body">
      <div class="row">
        <div class="col-3">
          <img src="path/to/image.jpg" alt="Image" width="200" height="200">
        </div>
        <div class="col-9">
            <h5>Reservation Details</h5>
            <p>2 Twin/Single Beds, Suite</p>
            <p>Check in:</p>
            <p>Check out:</p>
            <p>Room(s):</p>
            <p>Guest(s) per room:</p>
        </div>
      </div>
    </div>
  </div>
            <div class="container">
  <div class="row">
    <div class="col-md-6">
      <h2>Guest Information</h2>
      <form>
  <div class="form-group row">
    <label for="firstName" class="col-sm-3 col-form-label">First Name:</label>
    <div class="col-sm-9">
      <input type="text" id="firstName" name="firstName" class="form-control" required>
    </div>
  </div>

  <div class="form-group row">
    <label for="lastName" class="col-sm-3 col-form-label">Last Name:</label>
    <div class="col-sm-9">
      <input type="text" id="lastName" name="lastName" class="form-control" required>
    </div>
  </div>

  <div class="form-group">
    <label for="address" class="col-sm-3 col-form-label">Address:</label>
    <textarea id="address" name="address" class="form-control" rows="3" required></textarea>
  </div>

  <div class="form-group text-center">
    <button type="submit" class="btn btn-primary ">Reserve</button>
  </div>
</form>
    </div>
    <div class="col-md-6 text-center allign-items-center">
      <h2>Or</h2>
      <a Class="btn btn-primary">Sign in for faster booking</a>
    </div>
  </div>
</div>

            
            
            
            

