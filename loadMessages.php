<?php
include 'db.php';

function getMessages() {
    global $conn;
    $result = $conn->query("SELECT users.username, messages.message FROM messages INNER JOIN users ON users.user_id = messages.user_id ORDER BY messages.timestamp DESC LIMIT 8");
    return $result->fetch_all(MYSQLI_ASSOC);
}

$messages = getMessages();
foreach ($messages as $message) {
    echo "<p><strong>" . htmlspecialchars($message['username']) . ":</strong> " . htmlspecialchars($message['message']) . "</p>";
}
?>
