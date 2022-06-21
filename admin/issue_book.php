
<?php

//issue_book.php

include '../database_connection.php';

include '../function.php';

if(!is_admin_login())
{
	header('location:../admin_login.php');
}

$query = "
	SELECT * FROM lms_issue_book 
    ORDER BY issue_book_id DESC
";

$statement = $connect->prepare($query);

$statement->execute();

include '../header.php';

?>
<div class="container-fluid py-4" style="min-height: 700px;">
	<h1>Issue Book Management</h1>
    <?php 

    if(isset($_GET["action"]))
    {
        if($_GET["action"] == 'add')
        {
    ?>
    <ol class="breadcrumb mt-4 mb-4 bg-light p-2 border">
        <li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
        <li class="breadcrumb-item"><a href="issue_book.php">Issue Book Management</a></li>
        <li class="breadcrumb-item active">Issue New Book</li>
    </ol>
    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-user-plus"></i> Issue New Book
                </div>
                <div class="card-body">
                    <form method="post" autocomplete="off">
                        <div class="mb-3">
                            <label class="form-label">Book ISBN Number</label>
                            <input type="text" name="book_id" id="book_id" class="form-control" />
                            <span id="book_isbn_result"></span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">User Unique ID</label>
                            <input type="text" name="user_id" id="user_id" class="form-control" />
                            <span id="user_unique_id_result"></span>
                        </div>
                        <div class="mt-4 mb-0">
                            <input type="button" name="issue_book_button" id="issue_book_button" class="btn btn-success" value="Issue" />
                        </div>  
                    </form>
                  
                </div>
            </div>
        </div>
    </div>
    <?php 
        }
    }
    else
    {
    ?>
	<ol class="breadcrumb mt-4 mb-4 bg-light p-2 border">
		<li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
        <li class="breadcrumb-item active">Issue Book Management</li>
    </ol>

    <div class="card mb-4">
    	<div class="card-header">
    		<div class="row">
    			<div class="col col-md-6">
    				<i class="fas fa-table me-1"></i> Issue Book Management
                </div>
                <div class="col col-md-6" align="right">
                    <a href="issue_book.php?action=add" class="btn btn-success btn-sm">Add</a>
                </div>
            </div>
        </div>
        <div class="card-body">
        	<table id="datatablesSimple">
        		<thead>
        			<tr>
        				<th>Book ISBN Number</th>
                        <th>User Unique ID</th>
                        <th>Issue Date</th>
                        <th>Expected Return Date</th>
                        <th>Return Date</th>
                        <th>Late Return Fines</th>
                        <th>Status</th>
                        <th>Action</th>
        			</tr>
        		</thead>
        		<tfoot>
        			<tr>
        				<th>Book ISBN Number</th>
                        <th>User Unique ID</th>
                        <th>Issue Date</th>
                        <th>Expected Return Date</th>
                        <th>Return Date</th>
                        <th>Late Return Fines</th>
                        <th>Status</th>
                        <th>Action</th>
        			</tr>
        		</tfoot>
        		<tbody>
        		<?php
        		if($statement->rowCount() > 0)
        		{
        			$one_day_fine = get_one_day_fines($connect);

        			$currency_symbol = get_currency_symbol($connect);

        			set_timezone($connect);

        			foreach($statement->fetchAll() as $row)
        			{
        				$status = $row["book_issue_status"];

        				$book_fines = $row["book_fines"];

        				if($row["book_issue_status"] == "Issue")
        				{
                            
        					$current_date_time = new DateTime(get_date_time($connect));
        					$expected_return_date = new DateTime($row["expected_return_date"]);

        					if($current_date_time > $expected_return_date)
        					{
        						$interval = $current_date_time->diff($expected_return_date);

        						$total_day = $interval->d;

        						$book_fines = $total_day * $one_day_fine;

        						$status = 'Not Return';

        						$query = "
        						UPDATE lms_issue_book 
													SET book_fines = '".$book_fines."', 
													book_issue_status = '".$status."' 
													WHERE issue_book_id = '".$row["issue_book_id"]."'
        						";

        						$connect->query($query);
        					}
        				}

        				if($status == 'Issue')
        				{
        					$status = '<span class="badge bg-warning">Issue</span>';
        				}

        				if($status == 'Not Return')
        				{
        					$status = '<span class="badge bg-danger">Not Return</span>';
        				}

        				if($status == 'Return')
        				{
        					$status = '<span class="badge bg-primary">Return</span>';
        				}

        				echo '
        				<tr>
        					<td>'.$row["book_id"].'</td>
        					<td>'.$row["user_id"].'</td>
        					<td>'.$row["issue_date_time"].'</td>
                            <td>'.$row['expected_return_date'].'</td>
        					<td>'.$row["return_date_time"].'</td>
        					<td>'.$currency_symbol.$book_fines.'</td>
        					<td>'.$status.'</td>';
                            if($row['book_issue_status']!="Return")
            				echo '<td><button class="btn btn-success returnButton" value="'.$row['issue_book_id'].'">Return</button></td>';
                            else
                            echo '<td><button class="btn btn-success disabled" value="'.$row['issue_book_id'].'">Return</button></td>';
                            
        				echo '</tr>';
        			}
        		}
        		else
        		{
        			echo '
        			<tr>
        				<td colspan="7" class="text-center">No Data Found</td>
        			</tr>
        			';
        		}
        		?>
        		</tbody>
        	</table>
        </div>
    </div>
    <?php 
    }
    ?>
</div>

<?php 

include '../footer.php';

?>

<!-- Modal -->
<div class="modal fade" id="messageModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Message</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
 
      </div>
    </div>
  </div>
</div>


<script>
    $(document).ready(function(){
        $('.returnButton').click(function(){
            var value=$(this).val();
            $.ajax({
                url:'action.php',
                type:'post',
                data:{
                    action:'return_book',
                    issuebookid:value
                }, 
                success:function(response){
                    if(response.trim()=="true")
                    window.location.replace('issue_book.php');
                    else {
                        $('#messageModal').modal('show');
                        $('#messageModal .modal-body').html("failed to return the book");
                    }
                }
            });
        });

        $('#issue_book_button').click(function(){
            var userid = $('#user_id');
            var bookid = $('#book_id');
            $.ajax({
                url:'action.php',
                type:'post',
                data:{
                    action:'add_book_user',
                    userid:userid.val(),
                    isbn:bookid.val()
                }, 
                success:function(response){
                    if(response.trim()=="true")
                    {
                    window.location.replace('issue_book.php');
                    }
                    else if(response.trim()=="BookLimit")
                    {
                        $('#messageModal').modal('show');
                        $('#messageModal .modal-body').html("The User has exceed the Number of books that can borrow at the same time");
                    }
                    else if(response.trim()=='BookDeficit') {
                        $('#messageModal').modal('show');
                        $('#messageModal .modal-body').html("There are no books edition available for the user to borrow");
                    }
                }
            });
        });
        $('#book_id').on('keyup',function(){
            if($(this).val().length > 0)
                        {
                            $.ajax({
                                url:'action.php',
                                type:'post',
                                dataType:'json',
                                data:{
                                    action:"search_book_isbn",
                                    request:$(this).val()
                                },
                                success:function(response){
                                    var html = '<div class="list-group" style="position:absolute; width:93%">';
                                if(response.length > 0)
                                {
                                    for(var count = 0; count < response.length; count++)
                                    {
                                        html += '<a href="#" class="list-group-item list-group-item-action"><span onclick="get_text(this)">'+response[count].book_isbn_number+'</span> - <span class="text-muted">'+response[count].book_name+'</span></a>';
                                    }
                                }
                                else
                                {
                                    html += '<a href="#" class="list-group-item list-group-item-action">No Book Found</a>';
                                }

                                html += '</div>';

                                document.getElementById('book_isbn_result').innerHTML = html;
                            }
                                });
                            
                        }
                        else
                        {
                            document.getElementById('book_isbn_result').innerHTML = '';
                        }
                    });


                   $('#user_id').on('keyup',function(){
                    if($(this).val().length > 0)
                        {   
                           $.ajax({
                               url:'action.php',
                               type:'post',
                               dataType:'json',
                               data:{
                                   action:'search_user_id',
                                   request:$(this).val()
                               }
                               ,success:function(response){
                                var html = '<div class="list-group" style="position:absolute;width:93%">';
                               console.log(response.length);
                               if(response.length > 0)
                               {
                                   for(var count = 0; count < response.length; count++)
                                   {
                                       html += '<a href="#" class="list-group-item list-group-item-action"><span onclick="get_text1(this)">'+response[count].user_unique_id+'</span> - <span class="text-muted">'+response[count].user_name+'</span></a>';
                                   }
                               }
                               else
                               {
                                   html += '<a href="#" class="list-group-item list-group-item-action">No User Found</a>';
                               }
                               html += '</div>';

                               document.getElementById('user_unique_id_result').innerHTML = html;
                        
                               }
                           });
                        }
                        else
                        {
                            document.getElementById('user_unique_id_result').innerHTML = '';
                        }

                   }); 
                       
        });
           


                    
                    
                   

                    function get_text(event)
                    {
                        document.getElementById('book_isbn_result').innerHTML = '';

                        document.getElementById('book_id').value = event.textContent;
                    }

                    

                   

                    function get_text1(event)
                    {
                        document.getElementById('user_unique_id_result').innerHTML = '';

                        document.getElementById('user_id').value = event.textContent;
                    }

    </script>
