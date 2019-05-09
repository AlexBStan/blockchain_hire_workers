pragma solidity >=0.4.22 <0.6.0;



contract junior_database_administrator {



    string public name;

    uint public age;

    uint internal test_mark_SQL;

    uint internal test_mark_Azure;

    uint internal communication_skills;

    uint internal previous_exp;

    string internal english_knowledge;

    uint internal test_mark_python;

    string internal bachelor_degree;

    event Log(string);

    

    uint ItemCount;

    mapping (string => uint) other_certificates;

    uint[] public Importance;



    

    function stringToBytes32(string memory source) internal returns (bytes32 result) {

    bytes memory tempEmptyStringTest = bytes(source);

    if (tempEmptyStringTest.length == 0) {

        return 0x0;

    }



    assembly {

        result := mload(add(source, 32))

    }

   }

    

    

      function Compare(string storage a, string memory b) internal returns (bool) {

        if (bytes(a).length != stringToBytes32(b).length) {

            return false;

        }

        for (uint i = 0; i < bytes(a).length; i ++) {

            if(bytes(a)[i] != bytes(b)[i]) {

                return false;

            }

        }

        return true;

    }

    

    constructor (string memory _name, uint _age, string memory _bachelor_degree, uint _test_mark_SQL, uint _test_mark_Azure,

               uint _communication_skills, string memory _english_knowledge, uint _previous_exp, uint _test_mark_python

                ) internal {

                   name=_name;

                   age=_age;

                   bachelor_degree=_bachelor_degree;

                   test_mark_SQL=_test_mark_SQL;

                   test_mark_Azure=_test_mark_Azure;

                   communication_skills = _communication_skills;

                   english_knowledge=_english_knowledge;

                   previous_exp=_previous_exp;

                   test_mark_python=_test_mark_python;

                }

                

    

    function setcertificates(uint _importance, string memory _name) public {

         uint certificate = _importance;

         other_certificates[_name] = certificate;

         Importance.push(certificate);

        ItemCount++;

    }

    

    function getcertificate(string memory _name) public returns (uint importance){

        return(other_certificates[_name]);

    }

    

    function give_mark_SQL(uint mark) public {

        

        require(mark>0 && mark <=10);

        test_mark_SQL=mark;

    }

    

    function give_mark_Azure(uint mark) public {

      

     emit Log("Within function give_mark_Azure");

      if(mark<0 || mark >10){

          revert();

      }

     emit Log("Value is within expected range");

     emit Log("Returning value from function");

      

    }

    

    



    function english_level() internal returns (uint){

        

        if (Compare(english_knowledge,"intermediate")==false) 

             return 1;

        if (Compare(english_knowledge,"advanced")==false) 

             return 2;

         return 0;

    }

    

     function bachelors() internal returns (bool){

           if ((Compare(bachelor_degree,"ComputerScience")==false)&&(Compare(bachelor_degree,"Mathematics")==false)&&

           (Compare(bachelor_degree,"Engineering")==false)&&(Compare(bachelor_degree,"related")==false))

            return true;

            return false;

     }

     

     function tests_scores() internal returns(uint){

            return (test_mark_SQL+test_mark_Azure+test_mark_python);

     }

     

     function final_mark() public returns (uint) {

         uint e;

         uint mark;

         if (bachelors() && (test_mark_SQL<8 || test_mark_Azure<8))

               return 0;

        e= english_level();

        if(test_mark_SQL<5 || test_mark_Azure<5 || e==0 || communication_skills<5 )

             return 0;

         mark=e+tests_scores()+communication_skills+previous_exp;

         return mark;

     }

        

 }

               

               



contract senior_database_administrator is junior_database_administrator {

    

    uint private test_mark_Linux;

    bool private masters_degree;

    

         constructor (string memory _name, uint _age, string memory _bachelor_degree, uint _test_mark_SQL, uint _test_mark_Azure,

               uint _communication_skills, string memory _english_knowledge, uint _previous_exp, uint _test_mark_python,

                  uint _test_mark_Linux, bool _masters_degree ) internal {

                   name=_name;

                   age=_age;

                   bachelor_degree=_bachelor_degree;

                   if (_test_mark_SQL>0 )

                   test_mark_SQL=_test_mark_SQL;

                   test_mark_Azure=_test_mark_Azure;

                   communication_skills = _communication_skills;

                   english_knowledge=_english_knowledge;

                   previous_exp=_previous_exp;

                   test_mark_python=_test_mark_python;

                   test_mark_Linux=_test_mark_Linux;

                   masters_degree=_masters_degree;

                }

        

        function getLinux() public view returns(uint){

            return test_mark_Linux;

        }

        

        function getMasters() public view returns(bool){

            return masters_degree;

        }

        

        function give_mark_Linux(uint mark) public {

       emit Log("Within function give_mark_Linux");

      if(mark<0 || mark >10){

          revert();

      }

     emit Log("Value is within expected range");

     emit Log("Returning value from function");

        }

    

         function masters(bool ok) public {

        masters_degree=ok;

         }

    

        

        function tests_scores() internal returns (uint){

            return (tests_scores()+test_mark_Linux);

        }

        

        function  final_mark() public returns (uint) {

         uint e;

         uint mark;

         if (bachelors()==false)

            return 0;

         if ((masters_degree==false)&& (test_mark_SQL<9 || test_mark_Azure<9 || test_mark_Linux<9))

           return 0;

         if (test_mark_SQL<7 || test_mark_Azure<7 || e==0 || communication_skills<7 || test_mark_Linux<7)

             return 0;

         if (previous_exp<2)

             return 0;

         mark=e+tests_scores()+communication_skills+previous_exp;

         return mark;

           

        }

        

    

}