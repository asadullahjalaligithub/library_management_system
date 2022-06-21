<?php 
include('../database_connection.php');
include('../function.php');

if(isset($_POST['action']) && $_POST['action']=='search_book_isbn'){
    $isbn = $_POST['request'];
    $query = "select * from lms_book where book_isbn_number like '%$isbn%'";
    $result = $connect->query($query);
    $output=[];
	foreach($result as $row)
	{
        array_push($output,$row);
	}
   echo json_encode($output);
}


if(isset($_POST['action']) && $_POST['action']=='search_user_id'){
    $userid = $_POST['request'];
    $query = "select * from lms_user where user_unique_id like '%$userid%'";
    //echo $query;
    $result = $connect->query($query);
    $output=[];
	foreach($result as $row)
	{
        array_push($output,$row);
	}
   echo json_encode($output);
}


if(isset($_POST['action']) && $_POST['action']=='add_book_user'){

   $userid=$_POST['userid'];
   $isbn=$_POST['isbn'];
   // checking if the user has exceed the limit of books to borrow
   $query="SELECT count(issue_book_id) as count from lms_issue_book where book_issue_status!='Return' and user_id='$userid'";
   $result=$connect->query($query);
   foreach($result as $row)
      $count=$row['count'];
   if($count<get_per_user_book_issue_limit($connect))
   {
      // checking the availability of the book
      $query="select count(issue_book_id) as count from lms_issue_book where book_id='$isbn' and book_issue_status!='Return'";
      $result=$connect->query($query);
      foreach($result as $row)
         $issueCount=$row['count'];
      $query="select book_no_of_copy as count from lms_book where book_isbn_number='$isbn'";
      $result=$connect->query($query);
      foreach($result as $row)
         $bookCount=$row['count'];
     //    echo $issueCount."<".$bookCount;
      if($issueCount<$bookCount)
      {
         $issuedate=date('Y-m-d h:i:s');
         $return_day_limit=get_book_return_day_limit($connect);
         $returndate=date('Y-m-d h:i:s',strtotime($issuedate."+ ".$return_day_limit." days"));
         $query="insert into lms_issue_book (book_id,user_id,issue_date_time,expected_return_date) values('$isbn','$userid','$issuedate','$returndate')";
         if($connect->query($query))
         $result="true";
         else
         $result="false";
         echo $result;
      }
      else {
         echo "BookDeficit";
      }
   }
   else 
   {
      echo "BookLimit";
   }
}

if(isset($_POST['action']) && $_POST['action']=='return_book'){
   $issue_book_id=$_POST['issuebookid'];
   $currentDate=get_date_time($connect);
   $query="update lms_issue_book set return_date_time='$currentDate', book_issue_status='Return' where issue_book_id=$issue_book_id";
   if($connect->query($query))
   $result="true";
   else
   $result="false";
   echo $result;
}