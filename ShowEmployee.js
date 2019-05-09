import React, { Component } from 'react';

import './ShowEmployee.css'
import { devContract } from './setup';



export class ShowEmployee extends Component{

   
 
    render(){

       
        
        



        return(
        
        
        
       
            <div>

            <h3> Employee</h3>

            <hr />

            <table >

                <tbody id="7">

                    <tr>

                        <th>Name</th>
                          
                        <th>Mark</th> 

                    </tr>
                    <tr>

<th>Grigore Mihai Alex</th>
  
<th>7</th> 

</tr>
<tr>

<th>Stan Alex</th>
  
<th>10</th> 

</tr>
<tr>

<th>Eva Evgnosia</th>
  
<th>10</th> 

</tr>
                    <tr>
                     <th>   <input type="text" id="demo"></input> </th>
                     <th>   <input type="text" id="mark"></input> </th>
                     <th><button onClick="myFunction()" >Submit</button></th>
                    
                    </tr>
                   
                    

                </tbody>

            </table>
            
        
            
          </div>
        
        )

        function myFunction() {
            devContract.name=document.getElementById("demo").innerText;
            devContract.test_mark_os=document.getElementById("demo").innerText    ;
           
            
            }

    } 

}




export default ShowEmployee;