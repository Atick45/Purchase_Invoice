<?php
function add_item($id,$qty,$name,$price,$uom){	  
	  
          if(array_key_exists($id, $_SESSION['cart'])){
			 $_SESSION['cart'][$id]['qty']+=$qty;
			 $_SESSION['cart'][$id]['gross']=$_SESSION['cart'][$id]['qty']*$price;
			 
   		   }else{ 				
			
			 $_SESSION['cart'][$id]['id']=$id;
			 $_SESSION['cart'][$id]['name']=$name;
			 $_SESSION['cart'][$id]['uom']=$uom;
			 $_SESSION['cart'][$id]['qty']=$qty;
			 $_SESSION['cart'][$id]['price']=$price;
			 $_SESSION['cart'][$id]['gross']=$qty*$price;
			
			
		}
  
  }
  
  function remove_item($id){
	  if(array_key_exists($id, $_SESSION['cart'])){
	     unset($_SESSION['cart'][$id]); 
	  }
  }
  
  function print_cart(){
	  
	        $sl=1;
			$totalgr=0;
			
			echo "<table border='1' cellspacing='0px' cellpadding='10px'>
		<tr><th>ID</th><th>Name</th><th>Qty</th><th>UoM</th><th>Price</th><th>Total Amount</th><th>Remove item</th></tr>";
			
			
			foreach($_SESSION['cart'] as $item){
				
				$totalgr+=$item['gross'];
				echo "<tr>";
				echo "<td>$sl</td>";
				echo "<td>$item[name]</td>";				
				echo "<td>$item[qty]</td>";
				echo "<td>$item[uom]</td>";
				echo "<td>$item[price]</td>";
				echo "<td>$item[gross]</td>";
				echo "<td><form action='' method='post'>
							<input type='hidden' name='rid' value='$item[id]'>
							<input type='submit' name='btnRemove' value='Remove Item'>
						</form>
					</td>";
				echo "</tr>";
				
				$sl++;
				
			}//end foreach
			
			echo "<tr>
					<td colspan='5'>Gross Total</td>
					<td style='background-color:lightgray'>".$totalgr."</td>
				</tr>";
				
				echo "</table>";
	
 }
 

?>