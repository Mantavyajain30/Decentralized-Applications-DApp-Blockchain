pragma solidity ^0.5.0;

contract DStorage {
  // Name
  string public name='DStorage';
  // Number of files
  uint public fileCount = 0 ;
  // Mapping fileId=>Struct 
  mapping (uint => File) public files;

  // Struct
  struct File{
    uint fileId;
    string fileHash;
    uint fileSize;
    string fileType;
    string fileName;
    string fileDescription;
    uint uploadTime;
    address payable uploader;
  }


  // Event
  event FileUploaded(
    uint fileId,
    string fileHash,
    uint fileSize,
    string fileType,
    string fileName, 
    string fileDescription,
    uint uploadTime,
    address payable uploader
  );

  constructor() public {
  }

  // Upload File function
  function uploadFile(string memory _fileHash, uint _fileSize, string memory _fileType, 
  string memory _fileName, string memory _fileDescription) public {
    // the file hash 
    require(bytes(_fileHash).length > 0);
    // file type 
    require(bytes(_fileType).length > 0);
    // file description 
    require(bytes(_fileDescription).length > 0);
    // file fileName 
    require(bytes(_fileName).length > 0);
    // uploader address 
    require(msg.sender!=address(0));
    // file size
    require(_fileSize>0);

    // Increment file id
    fileCount ++;
    
    // Add File to the contract
    files[fileCount] = File(fileCount, _fileHash, _fileSize, _fileType, _fileName, _fileDescription, now, msg.sender);
    // Trigger an event
    emit FileUploaded(fileCount, _fileHash, _fileSize, _fileType, _fileName, _fileDescription, now, msg.sender);
  }
}