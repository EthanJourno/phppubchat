<?php
include 'db.php';

// Ajouter un utilisateur s'il n'existe pas
function addUser($username) {
    global $conn;
    // Vérifiez d'abord si l'utilisateur existe
    $stmt = $conn->prepare("SELECT user_id FROM users WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($row = $result->fetch_assoc()) {
        return $row['user_id'];
    } else {
        // Si l'utilisateur n'existe pas, ajoutez-le
        $stmt = $conn->prepare("INSERT INTO users (username) VALUES (?)");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        return $stmt->insert_id;
    }
}

// Poster un message
function postMessage($userId, $message) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO messages (user_id, message, timestamp) VALUES (?, ?, NOW())");
    $stmt->bind_param("is", $userId, $message);
    $stmt->execute();
}

function getMessages() {
    global $conn;
    $result = $conn->query("SELECT users.username, messages.message FROM messages INNER JOIN users ON users.user_id = messages.user_id ORDER BY messages.timestamp DESC LIMIT 8");
    return $result->fetch_all(MYSQLI_ASSOC);
}


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $message = $_POST['message'];
    $userId = addUser($username);
    postMessage($userId, $message);
    
    $messages = getMessages();
    foreach ($messages as $message) {
        echo "<p><strong>" . htmlspecialchars($message['username']) . ":</strong> " . htmlspecialchars($message['message']) . "</p>";
    }
    exit;
}
?>
