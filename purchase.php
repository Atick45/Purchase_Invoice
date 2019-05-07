<?php session_start();
require_once("lib.php");
$db=new mysqli('localhost','root','','shopping_cart') or die("database not connected");
?>

<?php
  
  if(isset($_POST["btnSave"])){
	  
	  $supplier_id=  $_POST["cmbSupplier"];
	  
	  $month=$_POST["cmbMonth"];
	  $day=$_POST["cmbDay"];
	  $year=$_POST["cmbYear"];
	  
	  
	  
  
      if(checkdate($month,$day,$year)){
		   
		 $date_str=$year."-".$month."-".$day;	  
	     $purchase_date=date("Y-m-d",strtotime($date_str));
	  
	     
		 $db->query("insert into purchase_invoice(supplier_id,purchase_date)value('$supplier_id','$purchase_date')");
		 
		 
		 foreach($_SESSION["cart"] as $row){
	  
	      $item_id=$row["id"];
		  $qty=$row["qty"];
		  $uom=$row["uom"];
		  $price=$row["price"];
		  $invoice_id=$db->insert_id;
	  
	     $db->query("insert into purchase_invoice_details(invoice_id,item_id,qty,uom,price)value('$invoice_id','$item_id','$qty','$uom','$price')");
	   
		 }
     
	      unset($_SESSION["cart"]);
	      echo "Saved";
	  
	  }else{
		  
		  echo "Invalid Date";
	  }
  
  
  }

?>



<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Shopping Cart</title>
</head>

<body>
<form action="#" method="post">
 
<div>
<table>
 <tr><td>Item</td><td>Qty</td><td>UoM</td><td>Price</td><td>Total</td></tr>
  <tr><td><select name="cmbProduct">
  
   <?php
      $item_result=$db->query("select id,name from products");
	  
	  while(list($id,$name)=$item_result->fetch_row()){
		  echo "<option value='$id'>$name</option>";
	  }
	  
	?>
  
  </select></td><td><input type="text" size="4" name="txtQty" /></td><td><select name="cmbUoM"><option>Piece</option><option>Kg</option></select></td><td><input type="text" size="5" name="txtPrice" /></td><td><input type="submit" value="Add"  name="btnAdd"/></td></tr>
 
</table>
</div>



<?php
function getname($id){
	global $db;
	
	$row=$db->query("select name from products where id='$id'");
	list($name)=$row->fetch_row();
	

	return $name;
}

	
	if(!isset($_SESSION['cart'])){
   		$_SESSION['cart'] = array();
	}
			
	if(isset($_POST['btnAdd'])){
			
			 $id=$_POST["cmbProduct"];
			 $product_name=getname($id);
			 $price=$_POST["txtPrice"];
			 $uom=$_POST["cmbUoM"];
			 $qty=$_POST["txtQty"];
			 $total=$price*$qty;
					 
		  		 
		add_item($id,$qty,$product_name,$price,$uom);
	}
	
	
	if(isset($_POST['btnRemove'])){
				$rid=$_POST['rid'];
				remove_item($rid);
		
	}
	
			
	 print_cart();		 
			
 
?>
<hr>

<div>
 Suppler<br><select name="cmbSupplier">
    <?php
      $supplier_result=$db->query("select id,name from supplier");
	  
	  while(list($sid,$sname)=$supplier_result->fetch_row()){
		  echo "<option value='$sid'>$sname</option>";
	  }
	  
	?>
 </select>
</div>
<div>
 Purchase Date<br/>
 <select name="cmbDay">
  <option>DD</option>
 <?php
    for($i=1;$i<=31;$i++){
		echo "<option>$i</option>";
	}
 ?>
 </select>
 <select name="cmbMonth">
 <option>MM</option>
 <?php
    
	$months=array(1=>"Jan",2=>"Feb",3=>"Mar",4=>"Apr");
   foreach($months as $key=>$value){
		echo "<option value='$key'>$value</option>";
	}
 ?>
 </select>
 <select name="cmbYear">
   <option>YYYY</option>
    <?php
    for($i=date("Y")-5;$i<=date("Y")+5;$i++){
		echo "<option>$i</option>";
	}
   ?>
 </select>
</div>
<input type="submit" name="btnSave" value="Save" />

</form>


</body>
</html>