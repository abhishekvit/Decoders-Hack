<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Xpenser</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
    <<!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">


</head>
<body>

<div class="wrapper">
	<div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://www.creative-tim.com" class="simple-text">
                    Xpenser <h6> My name is request.getSession().getAttribute("name")</h6>
            </div>

            <ul class="nav">
                <li>
                    <a href="dashboard.html">
                        <i class="ti-panel"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li class="active">
                    <a href="user.html">
                        <i class="ti-user"></i>
                        <p>User Profile</p>
                    </a>
                </li>
                <li>
                    <a href="user.html">
                        <i class="ti-view-list-alt"></i>
                        <p>Create Expense</p>
                    </a>
                </li>
                <li>
                    <a href="notifications.html">
                        <i class="ti-bell"></i>
                        <p>Notifications</p>
                    </a>
                </li>
				
            </ul>
    	</div>
    </div>

    <div class="main-panel">
		<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">Expense Report</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                                            </ul>

                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
 
                    <div class="col-lg-8 col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Expense Item </h4>
								
                            </div>
                            <div class="content">
                                

                                <form id="expense" action="/XpenserApp/ExpenseManager" method="POST">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="Expense">Expense Type</label>
                                                <input name="Expensetype1" type="text" class="form-control border-input" placeholder="Cab">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Merchant Name</label>
                                                <input name="Merchantname1" type="text" class="form-control border-input" placeholder="Ola">
                                            </div>
                                        </div>
										<div class="col-md-6">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Transaction Date</label>
                                                <input name="Transdate1" type="date" class="form-control border-input" placeholder="01/01/0001">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Invoice Number</label>
                                                <input name="invoice1" type="text" class="form-control border-input" placeholder="CRN1234">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Amount</label>
                                                <input name="amount1" type="number" class="form-control border-input" placeholder="123">
                                            </div>
                                        </div>
                                    </div>

                                   

        <div class="row">
            <div class="form-group">
             <label>Attach Bill</label>
<div class="col-md-12">
                                   <input name="img1" id="img1" type="file" accept="image/*" onchange="loadFile(event,c)">
<img id="output1" style="height: 300px;width: 50%;" />
<!--script>
 var loadFile = function(event) {
   var output = document.getElementById('output');
   output.src = URL.createObjectURL(event.target.files[0]);
 };
</script-->
     </div>  
                                    </div>
									

  </div>
  
  </form>
  <button class="btn waves-effect waves-light" type="button" name="action" id="addElement" onclick="addRow()">ADD
    <i class="material-icons right"></i>
  </button>
  
  <button class="btn waves-effect waves-light" type="button" name="action" id="addElement" onclick="submitImg()">POPULATE
    <i class="material-icons right"></i>
  </button>
  <button class="btn waves-effect waves-light" type="submit" name="action" id="submit" onclick="" style="align:right">SUBMIT
    <i class="material-icons right"></i>
  </button>
  
  <script>
    c=1;
//document.getElementById("addElement").onclick = function() {myFunction()};



function addRow() {
    var div = document.createElement('div');
    c=c+1;
    div.className = 'row';

    div.innerHTML 

    str=

     '<div class="row">\
        <div class="col-md-6">\
            <div class="form-group">\
                                                <label for="Expense">Expense Type</label>\
                                                <input id="Expensetype"'+c+'type="text" class="form-control border-input" placeholder="Cab">\
                                            </div>\
                                        </div>\
                                        <div class="col-md-6">\
                                            <div class="form-group">\
                                                <label for="exampleInputEmail1">Merchant Name</label>\
                                                <input id="Merchantname"'+c+'type="text" class="form-control border-input" placeholder="Ola">\
                                            </div>\
                                        </div>\
										<div class="col-md-6">\
                                            <div class="form-group">\
                                                <label for="exampleInputEmail1">Transaction Date</label>\
                                                <input id="Transdate"'+c+'type="date" class="form-control border-input" placeholder="01/01/0001">\
                                            </div>\
                                        </div>\
                                    </div>\
                                    <div class="row">\
                                        <div class="col-md-6">\
                                            <div class="form-group">\
                                                <label>Invoice Number</label>\
                                                <input id="invoice"'+c+'type="text" class="form-control border-input" placeholder="CRN1234">\
                                            </div>\
                                        </div>\
                                        <div class="col-md-6">\
                                            <div class="form-group">\
                                                <label>Amount</label>\
                                                <input id="amount"'+c+'type="number" class="form-control border-input" placeholder="123">\
                                            </div>\
                                        </div>\
                                    </div>\
                                    <div class="row">\
            <div class="form-group">\
             <label>Attach Bill</label>\
<div class="col-md-12">\
                                   <input type="file" accept="image/*" onchange="loadFile(event,2)">\
<img id="output'
str=str+c+'"';
str=str+' style="height: 300px;width: 50%;" />\
     </div>\
     </div>\
     </div>';

console.log(str);
     div.innerHTML = str;
    document.getElementById('expense').appendChild(div);
}
</script>




    
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>


       

  
</div>


</body>

    <!--   Core JS Files   -->
    <script src="assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>
    <script>
 var loadFile = function(event,cnt) {
    console.log('output'+cnt)
   var output = document.getElementById('output'+cnt);
   output.src = URL.createObjectURL(event.target.files[0]);
 };
 
 function submitImg()
 {
	
	 console.log("test");
	 var XHR=new XMLHttpRequest();
	 var x = document.getElementById("expense").elements[5].value;
	    
	 XHR.open("GET","ExpenseManager?name="+"upload"+"&img="+x);
	 
	 XHR.send();
	 XHR.onreadystatechange=function()
	 {
		 if(XHR.readyState==4)
			 {
			 	console.log("testNEW")
			 	var v1=XHR.responseText;
			 	//document.getElementById("Expensetype1").value=v1;
			 	document.getElementById("expense").elements[1].value=v1;
			 }
	 }
 }
 

 
 
</script>



</html>