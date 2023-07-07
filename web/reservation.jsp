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
        <div style="text-align: center;">
  <h1>Search Result</h1>
</div>

        <div class="container-fluid text-center" style="background:lightgray; padding: 20px;">
  <form action="#">
    <div class="row justify-content-center mb-2">
      <div class="col-md-5">Dates</div>
      <div class="col-md-4">Rooms & Guests</div>
    </div>
    <div class="row justify-content-center">
      <div class="col-md-2">
        <input class="form-control"  type="date" name="dateStart"/>
      </div>
      <div class="col-md-auto">
        &rarr;
      </div>
      <div class="col-md-2 border-right">
        <input class="form-control"  type="date" name="dateEnd"/>
      </div>
      <div class="col-md-1">
        <input class="form-control" style="//width:40px" type="number" name="roomCount" value="1"/>
      </div>
      <div class="col-md-auto">
        Room,
      </div>
      <div class="col-md-1">
        <input class="form-control" style="//width:40px" type="number" name="guestCount" value="1"/> 
      </div>
      <div class="col-md-auto">
        Pax
      </div>
      <div class="col-md-1">
        <a href="reservation.jsp">
          <div class="btn btn-secondary justify-content-end">
            Edit
          </div>
        </a>
      </div>
    </div>
  </form>

</div>


        <!column 1>
        </div>
        <div class="container">
  <div class="card">
    <div class="card-body">
      <div class="row">
        <div class="col-md-6">
          <h5>2 Twin/Single Bed, Guest Room</h5>
        </div>
        <div class="col-md-6">
          <p>12 Rooms Available</p>
        </div>
      </div>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-md-4">
          <img src="path/to/logo.png">
        </div>
        <div class="col-md-4">
          <h5>400 myr/night</h5>
        </div>
        <div class="col-md-4">
          <a class="btn btn-primary">Select</a>
        </div>
      </div>
    </div>
  </div>
</div>

        <!column 2>
        <div class="container">
  <div class="card">
    <div class="card-body">
      <div class="row">
        <div class="col-md-6">
          <h5>1 King Bed, Guest Room</h5>
        </div>
        <div class="col-md-6">
          <p>12 Rooms Available</p>
        </div>
      </div>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-md-4">
          <img src="path/to/logo.png">
        </div>
        <div class="col-md-4">
          <h5>450 myr/night</h5>
        </div>
        <div class="col-md-4">
          <a class="btn btn-primary">Select</a>
        </div>
      </div>
    </div>
  </div>
</div>
        <!column 3>
        <div class="container">
  <div class="card">
    <div class="card-body">
      <div class="row">
        <div class="col-md-6">
          <h5>2 Twin/Single Bed, Suite</h5>
        </div>
        <div class="col-md-6">
          <p>12 Rooms Available</p>
        </div>
      </div>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-md-4">
          <img src="path/to/logo.png">
        </div>
        <div class="col-md-4">
          <h5>500 myr/night</h5>
        </div>
        <div class="col-md-4">
          <a class="btn btn-primary">Select</a>
        </div>
      </div>
    </div>
  </div>
</div>
        
        <!-- login -->
        <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <form action="LoginServlet" method="POST">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-4" id="exampleModalLabel">Welcome to HMS Hotel</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p class="fs-5">Sign in to your account</p>
                            <div class="mb-3">
                                <label for="loginUsername" class="form-label">Username</label>
                                <input type="text" name="login_username" class="form-control" id="loginUsername">
                            </div>
                            <div class="mb-3">
                                <label for="loginPassword" class="form-label">Password</label>
                                <input type="password" name="login_password" class="form-control" id="loginPassword">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Sign In</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
