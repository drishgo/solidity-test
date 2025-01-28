//Get funds from users
//Withdraw funds
//Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


//gas cost: 850,193 gas
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import "./PriceConverter.sol";
error NotOwner();
contract FundMe{

    using PriceConverter for uint256;
    uint256 public constant minimumUSD = 25*1e18; //constant defined vars dont take up storage spot 
    //new gas: 827,270
    address[] public  patrons;
    mapping(address=> uint256) public fundingGivenByAddress;
    /*
    CONSTRUCTOR IN SOLIDITY IS SAME AS CONSTRUCTOR IN JAVA, BUT IN THIS CASE,
    IT IS USED FOR CREATING A NEW INSTANCE OF A GIVEN CONTRACT RATHER THAN CREATING
    INSTANCE OF OBJECT.
    */
    address public immutable i_owner;
    //new gas: 800624
    constructor(){
            /*
                when a new instance of the contract is deployed, the constructor is
                automatically called and the code inside of the constructor is automatically 
                executed first, much like constructors in Java.
            */
            i_owner = msg.sender;
    }

    function fund() public payable {

               require(msg.value.getConversionRate()>=minimumUSD,"The funding does not meet base requirement ");
                patrons.push(msg.sender);   
                fundingGivenByAddress[msg.sender]=msg.value;
    }

    modifier onlyOwner {
        // require(msg.sender==i_owner,"Cannot withdraw");
        if(msg.sender!=i_owner){
            revert NotOwner();
        }
        _;
    /* The _; represents the function code like withdrow is onlyOwner so when
        withdraw is tagged with onlyOwner, the _; represents the code of withdraw.
    */
      }



    function Withdraw() public onlyOwner {
        //Setting condition that only the contract owner can withdraw eth.
        
        for(uint256 i = 0;i<patrons.length; i++){
            address patron = patrons[i];
            fundingGivenByAddress[patron] = 0;
    }
    patrons = new address[](0);
    require(payable(msg.sender).send(address(this).balance),"Could not send Try again");
}
    receive() external payable {
        fund();

     }
     fallback() external payable {
        fund();
      }
}


// PAYABLE ALLOWS TRANSACTIONS TO OCCUR BETWEEN WALLETS AND CONTRACTS.
// CONTRACT ALSO ACTS LIKE A WALLET ADDRESS THAT CAN STORE ETHER.
// A PAYABLE PARAMETER ALLOWS A FUNCTION AND THEREFORE A CONTRACT TO BE ABLE TO
// PERFORM ETHER TRANSFER TO AND FROM AN EOA LIKE METAMASK.
// SO THE FUNCTION fund() IS DECLARED TO BE PAYABLE.



/* AT THE TIME OF WRITING THIS CONTRACT NONE OF IT WOULD GET DEOPLYED ON THIS SHITTY
   ASS NETWORK COZ THE NETWORK FEES IS TOO FUCKING HIGH MAN WTF
    DOG
*/


//  RECIEVE - recieve()