<?php 
include 'chat.php';
?>
<html>
<head>
    <title>Chat public</title>
    <!-- Ajoutez ici tout autre code CSS ou JavaScript nécessaire -->
</head>
<body>

    <div id="messages">
        <!-- Les messages seront affichés ici -->
    </div>
    <form id="chatForm">
        Nom: <input type="text" name="username" required>
        Message: <textarea name="message" required></textarea>
        <input type="submit" value="Envoyer">
    </form>

<script>
function loadMessages() {
    fetch("loadMessages.php")
        .then(response => response.text())
        .then(data => {
            document.getElementById("messages").innerHTML = data;
        })
        .catch(error => console.error("Erreur AJAX:", error));
}

document.addEventListener("DOMContentLoaded", function() {
    loadMessages();

        document.getElementById("chatForm").addEventListener("submit", function(e) {
            e.preventDefault();

            var formData = new FormData(this);

            fetch("chat.php", {
                method: "POST",
                body: formData
            })
            .then(response => response.text())
            .then(data => {
                document.getElementById("messages").innerHTML = data;
            })
            .catch(error => console.error("Erreur AJAX:", error));
        });
    });
</script>
</body>
</html>
