<?php

namespace RavenDBTest;

class RavenDocument
{
    private $__id = null;
    private $__lastModified = null;
    private $__ravenLastModified = null;
    private $__etag = null;
    private $__data = null;
    private $__isStored = null;

    public function __construct($documentJSON)
    {
        $this->__parse($documentJSON);
    }

    public function toJSON()
    {
        return json_encode($this->__data);
    }

    public function sendTo(RavenDB $RavenDBInstance)
    {
    }

    public function Set($field, $value)
    {
    }

    public function add($field, $value)
    {
    }

    public function Rename($field, $value)
    {
    }

    public function Copy($field, $valie)
    {
    }

    private function __parseMetadata($metadata)
    {
        var_dump($metadata);
        $this->__id = $metadata["@id"];
        $this->__lastModified = $metadata["Last-Modified"];
        $this->__ravenLastModified = $metadata["Raven-Last-Modified"];
        $this->__etag = $metadata["@etag"];
    }

    private function __parse($document)
    {
        $data = array();
        var_dump($document);
        foreach ($document as $key => $value) {
            if ($key == '@metadata') {
                $this->__isStored = true;
                $this->__parseMetadata($value);
                continue;
            }
            $data[$key] = $value;
        }
        $this->__data = (object)$data;
    }

}
