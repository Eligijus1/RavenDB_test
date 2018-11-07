<?php

namespace RavenDBTest;

class RavenDB
{
    const GET = 'GET';
    const POST = 'POST';
    const PUT = 'PUT';
    const PATCH = 'PATCH';
    private $__host = null;
    private $__port = null;

    public function __construct($host = "127.0.0.1", $port = 8080)
    {
        $this->__host = $host;
        $this->__port = $port;
    }

    static public function getInstance($host, $port)
    {
        return new RavenDB($host, $port);
    }

    public function call($command, $data = array())
    {
        return $this->__call_api($command, $data);
    }

    private function __call_api($endpoint, $data = array(), $type = RavenDB::GET)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "http://{$this->__host}:{$this->__port}/{$endpoint}");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }

    private function __prepareDocumentsList($resultJSON)
    {
        $json = json_decode($resultJSON, true);
        $documents = array();
        if (!empty($resultJSON)) {
            foreach ($json as $key => $value) {
                $documents[] = new RavenDocument($value);
            }
        }
        return $documents;
    }

    public function getDocumentsList()
    {
        return $this->__prepareDocumentsList($this->__call_api('docs'));
    }

    public function putDocument($data)
    {
        return $this->__call_api('docs', $data, RavenDB::PUT);
    }
}
