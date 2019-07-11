<?php
include 'config.php';
include 'conn.php';


$empty_fields = false;
$success = false;

$action = isset($_GET['action']) ? $_GET['action'] : '';
$inserted = isset($_GET['inserted']) ? $_GET['inserted'] : false;

switch ($action) {

	case 'add':

		$first_name = isset($_GET['first_name']) ? $_GET['first_name'] : '';
		$last_name = isset($_GET['last_name']) ? $_GET['last_name'] : '';
		$email = isset($_GET['email']) ? $_GET['email'] : '';
		$mobile = isset($_GET['mobile']) ? $_GET['mobile'] : '';
		$gender = isset($_GET['gender']) ? $_GET['gender'] : '0';

		if(empty($first_name) || empty($last_name) || empty($email) || empty($mobile) || empty($gender)){
			
			$empty_fields = true;	

		} else {

			$sql = "INSERT INTO students (first_name, last_name, email, mobile, gender_id) 
					VALUES(:first_name, :last_name, :email, :mobile, :gender);";

			$success = false;

			try {

				$stmt = $conn -> prepare($sql);
				$res = $stmt -> execute([
					'first_name' => $first_name, 
					'last_name' => $last_name, 
					'email' => $email, 
					'mobile' => $mobile, 
					'gender' => $gender
				]);

				header('Location: index.php?action=list&inserted=true');
				exit;

				$success = true;

			}
			catch(Exception $e) {

				echo 'Exception -> ';
				var_dump($e->getMessage());

				?>
				<div class="alert alert-danger">
				  	<strong>database error!</strong>
				</div>
				<?php

			}

		}

		break;


	case 'delete':

		$student_id = $_GET['student_id'];

		// $query = "DELETE FROM students WHERE id = " . $student_id;
		$query = "UPDATE students SET deleted = 1 WHERE id = " . $student_id;

		$stmt = $conn -> query($query);
		Header("Location: index.php?action=list");
		break;
	
	case 'editDB':
		$edit_first = isset($_GET['first_name_edit']) ? $_GET['first_name_edit'] : '';	
		$edit_last = isset($_GET['last_name_edit']) ? $_GET['last_name_edit'] : '';	
		$edit_email = isset($_GET['email_edit']) ? $_GET['email_edit'] : '';	
		$edit_mobile = isset($_GET['mobile_edit']) ? $_GET['mobile_edit'] : '';	
		$edit_gender = isset($_GET['gender_edit']) ? $_GET['gender_edit'] : '';	

		
			$student_id = $_GET['student_id'];
			$sql = "UPDATE students SET first_name = '$edit_first',last_name = '$edit_last', email = '$edit_email',mobile = '$edit_mobile',
			gender_id = '$edit_gender' 
			WHERE id = " . $student_id;
			$stmt = $conn -> query($sql);
			Header("Location: index.php?action=list");
			


		
	break;

	default:
		# code...
		break;
}


// select all users
$query = "	SELECT 
				students.*,
					gender.name AS gender_name
			FROM students
			INNER JOIN gender ON gender.id = students.gender_id
			WHERE deleted = 0
			ORDER BY id DESC;";
$stmt = $conn -> query($query);

$students = $stmt -> fetchAll();

// echo '<pre>';
// print_r($_GET);
// echo '</pre>';


?><!DOCTYPE html>
<html lang="en">
<head>
	<title>Bootstrap Example</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">Learning</a>
	   	 </div>
	   	 <ul class="nav navbar-nav">
	      <li class="<?php if ($action=="list") echo "active"; ?>"><a href="index.php?action=list">Students list</a></li>
	      <li class="<?php if ($action=="addstudent") echo "active"; ?>"><a href="index.php?action=addstudent">Add student</a></li>
	      <li><a href="#">Page 2</a></li>
	      <li><a href="#">Page 3</a></li>
	    </ul>
	  </div>
	</nav>



	



	<div class="container">
		
		<?php
		if ($empty_fields) {
			?>
			<div class="alert alert-danger">
	 		 	<strong>Fill all required fields!</strong> 
			</div>
			<?php
		} else if ($inserted) {
			?>
			<div class="alert alert-success">
			  	<strong>Inserted Successfully!</strong>
			</div>
			<?php
		}

		switch($action){
			case 'addstudent':
			?>
				<h2>Add New Student</h2>

				<form action="index.php" method="get">

					<div class="form-group">
						<label for="usr">First Name:</label>
						<input type="text" class="form-control" name="first_name" placeholder="fisrt name">
					</div>

					<div class="form-group">
						<label for="usr">Last Name:</label>
						<input type="text" class="form-control" name="last_name" placeholder="last name">
					</div>

					<div class="form-group">
						<label for="email">Email:</label>
						<input type="text" class="form-control" name="email" id="email" placeholder="Email">
					</div>

					<div class="form-group">
						<label for="usr">Mobile:</label>
						<input type="text" class="form-control" name="mobile" placeholder="mobile">
					</div>

					<div class="form-group">
						<label for="gender">Gender:</label>
						<select class="form-control" name="gender">
							<option value="1">male</option>
							<option value="2">female</option>
						</select>
					</div> 

					 <button type="submit" class="btn">Add Student</button>

					<input type="hidden" name="action" value="add">

				</form>

				

				 
			<?php
			break;

			case 'list':
				if(!count($students)){
					?>
					<div class="alert alert-danger">
			 		 	<strong>No students found!</strong> 
					</div>
					<?php
				}else{
					?>
					<h2>Students List</h2>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Student ID</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Email</th>
								<th>Mobile</th>
								<th>Birth Date</th>
								<th>Gender</th>
								<th>DEL</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>

							<?php

							foreach ($students as $student) {
								?>
								<tr>
								<td><?php echo $student['id'] ?></td>
								<td><?php echo $student['first_name'] ?></td>
								<td><?=$student['last_name']?></td>
								<td><?=$student['email']?></td>
								<td><?=$student['mobile']?></td>
								<td><?=$student['birth_date']?></td>
								<td><?=$student['gender_name']?></td>
								<td>
									<a href="?action=delete&student_id=<?=$student['id']?>">
										<img style="width: 25px; cursor: pointer;" src="icons/delete.png">
									</a>
								</td>
								<td>
									<a href="?action=edit&student_id=<?=$student['id']?>&student_first=<?=$student['first_name']?>
									&student_last=<?=$student['last_name']?>&student_email=<?=$student['email']?>&student_mobile=<?=$student['mobile']?>&student_birth_date=<?=$student['birth_date']?>&student_gender=<?=$student['gender_name']?>">
										<img style="width: 50px; cursor:pointer; border-radius:50%" src="icons/edit_pencil2.jpg">
									</a>
								</td>
								</tr>
								<?php
							}

							
							?>

						</tbody>
					</table>
					<?php

				}
			?>

				
			<?php
			break;

			case 'edit':
			$student_id = $_GET['student_id'];
			$student_first = $_GET['student_first'];
			$student_last = $_GET['student_last'];
			$student_email = $_GET['student_email'];
			$student_mobile = $_GET['student_mobile'];
			$student_gender = $_GET['student_gender'];
			?>
				<h2>Edit Student</h2>

				<form action="index.php" method="get">

					<div class="form-group">
						<label for="usr">First Name: <?php echo $student_first ?></label>
						<input type="text" class="form-control" name="first_name_edit" placeholder="fisrt name" value="<?php echo $student_first ?>">
					</div>

					<div class="form-group">
						<label for="usr">Last Name: <?php echo $student_last ?></label>
						<input type="text" class="form-control" name="last_name_edit" placeholder="last name" value="<?php echo $student_last ?>">
					</div>

					<div class="form-group">
						<label for="email">Email: <?php echo $student_email ?></label>
						<input type="text" class="form-control" name="email_edit" id="email" placeholder="Email" value="<?php echo $student_email ?>">
					</div>

					<div class="form-group">
						<label for="usr">Mobile: <?php echo $student_mobile ?></label>
						<input type="text" class="form-control" name="mobile_edit" placeholder="mobile" value="<?php echo $student_mobile ?>">
					</div>

					<div class="form-group">
						<label for="gender">Gender: <?php echo $student_gender ?></label>
						<select class="form-control" name="gender_edit">
							<option value="1">male</option>
							<option value="2">female</option>
						</select>
					</div> 

					 <button type="submit" class="btn">Edit Student</button>

					<input type="hidden" name="action" value="editDB">
					<input type="hidden" name="student_id" value="<?php echo $student_id ?>">

				</form>

				

				 
			<?php


			break;
		}

		?>
		
		



		
	</div>

</body>
</html>


