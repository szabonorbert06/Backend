<?php
/*
require_once 'config.php';

// Set the content type to JSON
header('Content-Type: application/json');

// Read operation (retrieve books)
$stmt = $pdo->query('SELECT * FROM BOOK');
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);
*/
require_once 'config.php';

// Set the content type to JSON
header('Content-Type: application/json');

// Handle HTTP methods
$method = $_SERVER['REQUEST_METHOD'];
switch ($method) {
	case 'GET':

		// Read operation (retrieve books)
		$stmt = $pdo->query('SELECT * FROM BOOK');
		$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($result);
	break;
	
	 case 'POST':
		// Create operation (add a new book)
		$json = file_get_contents('php://input');
		$data = json_decode($json,true);
		$title = $data['Title'];
		$author = $data['Author'];
		$topic = $data['Topic'];
		$stmt = $pdo->prepare('INSERT INTO BOOK (Title, Author, Topic) VALUES 
							 (?, ? ,?)');
		$stmt->execute([$title, $author, $topic]);
		echo json_encode(['message' => 'New Book added successfully']);
	break;
	
	case 'PUT':
		// Update operation (edit a book)
		$json = file_get_contents('php://input');
		$data = json_decode($json,true);
		$id = $data['BookId'];
		$title = $data['Title'];
		$author = $data['Author'];
		$topic = $data['Topic'];
		$stmt = $pdo->prepare('UPDATE BOOK SET Title=?, Author=?, Topic=? WHERE BookId=?');
		$stmt->execute([$title, $author, $topic, $id]);
		echo json_encode(['message' => 'Book updated successfully']);
		break;
		
		case 'DELETE':
		// Delete operation (remove a book)
		$json = file_get_contents('php://input');
		$data = json_decode($json,true);
		$id = $data['BookId’];
		$stmt = $pdo->prepare('DELETE FROM BOOK WHERE BookId=?');
		$stmt->execute([$id]);
		echo json_encode(['message' => 'Book deleted successfully']);
	break;


	default:

		// Invalid method
		http_response_code(405);
		echo json_encode(['error' => 'Method not allowed']);
	break;
}



?>
