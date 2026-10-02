<?php

header("Access-Control-Allow-Origin: *");

$file = $_GET['file'] ?? '';

if (empty($file)) {
    http_response_code(404);
    exit;
}

$file = basename($file);

$path = __DIR__ . '/uploads/' . $file;

if (!file_exists($path)) {
    http_response_code(404);
    exit;
}

$mime = mime_content_type($path);

header("Content-Type: " . $mime);
header("Content-Length: " . filesize($path));

readfile($path);
exit;
?>