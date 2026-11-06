// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Campus Notice Board - MG3012 Assignment 2
/// @notice Anyone can post a short notice on-chain and like notices.
contract NoticeBoard {
    struct Notice {
        address author;
        string text;
        uint256 likes;
        uint256 timestamp;
    }

    Notice[] private notices;
    mapping(uint256 => mapping(address => bool)) private hasLiked;

    event NoticePosted(uint256 indexed id, address indexed author, string text);
    event NoticeLiked(uint256 indexed id, address indexed liker, uint256 totalLikes);

    // ---------- WRITE FUNCTIONS (cost gas, need a transaction) ----------

    /// @notice Post a new notice
    function postNotice(string calldata _text) external {
        require(bytes(_text).length > 0, "Notice cannot be empty");
        require(bytes(_text).length <= 280, "Max 280 characters");
        notices.push(Notice(msg.sender, _text, 0, block.timestamp));
        emit NoticePosted(notices.length - 1, msg.sender, _text);
    }

    /// @notice Like a notice (one like per address per notice)
    function likeNotice(uint256 _id) external {
        require(_id < notices.length, "Notice does not exist");
        require(!hasLiked[_id][msg.sender], "Already liked");
        hasLiked[_id][msg.sender] = true;
        notices[_id].likes += 1;
        emit NoticeLiked(_id, msg.sender, notices[_id].likes);
    }

    // ---------- READ FUNCTIONS (free, no transaction) ----------

    /// @notice Total number of notices posted
    function getNoticeCount() external view returns (uint256) {
        return notices.length;
    }

    /// @notice Get one notice by id
    function getNotice(uint256 _id)
        external
        view
        returns (address author, string memory text, uint256 likes, uint256 timestamp)
    {
        require(_id < notices.length, "Notice does not exist");
        Notice storage n = notices[_id];
        return (n.author, n.text, n.likes, n.timestamp);
    }

    /// @notice Get the most recent notice
    function getLatestNotice()
        external
        view
        returns (address author, string memory text, uint256 likes, uint256 timestamp)
    {
        require(notices.length > 0, "No notices yet");
        Notice storage n = notices[notices.length - 1];
        return (n.author, n.text, n.likes, n.timestamp);
    }
}
