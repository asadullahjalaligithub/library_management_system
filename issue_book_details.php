
<?php

//issue_book_details.php

include 'database_connection.php';

include 'function.php';

if(!is_user_login())
{
	header('location:user_login.php');
}

include 'header.php';

?>
<div class="container-fluid py-4">
	<h1>Issue Book Detail</h1>

</div>
<?php

$query = "select * from lms_issue_book
inner join lms_book on lms_book.book_isbn_number=lms_issue_book.book_id 
inner join lms_category on lms_category.category_id=lms_book.book_category_id 
inner join lms_author on lms_author.author_id=lms_book.book_author_id 
where lms_issue_book.user_id='".$_SESSION['user_id']."'";

$statement = $connect->prepare($query);

$statement->execute();


?>

<div class="container-fluid" style="min-height: 700px;">


	<div class="card mb-4">
		<div class="card-header">
			<div class="row">
				<div class="col col-md-6">
					<i class="fas fa-table me-1"></i> Book List
				</div>
				<div class="col col-md-6" align="right">

				</div>
			</div>
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th>Book Name</th>
						<th>ISBN No.</th>
						<th>Category</th>
						<th>Author</th>
						<th>Status</th>
						<th>Issued</th>
						<th>Expected Return Date</th>
						<th>Return Date</th>
						<th>Late Return Fine</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>Book Name</th>
						<th>ISBN No.</th>
						<th>Category</th>
						<th>Author</th>
						<th>Status</th>
						<th>Issued</th>
						<th>Expected Return Date</th>
						<th>Return Date</th>
						<th>Late Return Fine</th>
					</tr>
				</tfoot>
				<tbody>
				<?php 

				if($statement->rowCount() > 0)
				{
					foreach($statement->fetchAll() as $row)
					{
						
						echo '
							<tr>
								<td>'.$row["book_name"].'</td>
								<td>'.$row["book_isbn_number"].'</td>
								<td>'.$row["category_name"].'</td>
								<td>'.$row["author_name"].'</td>
								<td>'.$row["book_issue_status"].'</td>
								<td>'.$row["issue_date_time"].'</td>
								<td>'.$row['expected_return_date'].'</td>
								<td>'.$row["return_date_time"].'</td>
								<td>'.$row["book_fines"].'</td>
							</tr>
						';
					}
				}
				else
				{
					echo '
					<tr>
						<td colspan="8" class="text-center">No Data Found</td>
					</tr>
					';
				}

				?>
				</tbody>
			</table>
		</div>
	</div>
</div>







<?php 

include 'footer.php';

?>
