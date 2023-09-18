// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("Systems")));
bytes32 constant SystemsTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0015020014010000000000000000000000000000000000000000000000000000
);

library Systems {
  /** Get the table values' field layout */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](1);
    _keySchema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_keySchema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](2);
    _valueSchema[0] = SchemaType.ADDRESS;
    _valueSchema[1] = SchemaType.BOOL;

    return SchemaLib.encode(_valueSchema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "resourceSelector";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](2);
    fieldNames[0] = "system";
    fieldNames[1] = "publicAccess";
  }

  /** Register the table with its config */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table with its config */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table with its config (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Get system */
  function getSystem(bytes32 resourceSelector) internal view returns (address system) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /** Get system */
  function _getSystem(bytes32 resourceSelector) internal view returns (address system) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /** Get system (using the specified store) */
  function getSystem(IStore _store, bytes32 resourceSelector) internal view returns (address system) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    bytes32 _blob = _store.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /** Set system */
  function setSystem(bytes32 resourceSelector, address system) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((system)), _fieldLayout);
  }

  /** Set system */
  function _setSystem(bytes32 resourceSelector, address system) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    StoreCore.setField(_tableId, _keyTuple, 0, abi.encodePacked((system)), _fieldLayout);
  }

  /** Set system (using the specified store) */
  function setSystem(IStore _store, bytes32 resourceSelector, address system) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((system)), _fieldLayout);
  }

  /** Get publicAccess */
  function getPublicAccess(bytes32 resourceSelector) internal view returns (bool publicAccess) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /** Get publicAccess */
  function _getPublicAccess(bytes32 resourceSelector) internal view returns (bool publicAccess) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /** Get publicAccess (using the specified store) */
  function getPublicAccess(IStore _store, bytes32 resourceSelector) internal view returns (bool publicAccess) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    bytes32 _blob = _store.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /** Set publicAccess */
  function setPublicAccess(bytes32 resourceSelector, bool publicAccess) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((publicAccess)), _fieldLayout);
  }

  /** Set publicAccess */
  function _setPublicAccess(bytes32 resourceSelector, bool publicAccess) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    StoreCore.setField(_tableId, _keyTuple, 1, abi.encodePacked((publicAccess)), _fieldLayout);
  }

  /** Set publicAccess (using the specified store) */
  function setPublicAccess(IStore _store, bytes32 resourceSelector, bool publicAccess) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((publicAccess)), _fieldLayout);
  }

  /** Get the full data */
  function get(bytes32 resourceSelector) internal view returns (address system, bool publicAccess) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /** Get the full data */
  function _get(bytes32 resourceSelector) internal view returns (address system, bool publicAccess) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 resourceSelector) internal view returns (address system, bool publicAccess) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = _store.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /** Set the full data using individual values */
  function set(bytes32 resourceSelector, address system, bool publicAccess) internal {
    bytes memory _staticData = encodeStatic(system, publicAccess);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /** Set the full data using individual values */
  function _set(bytes32 resourceSelector, address system, bool publicAccess) internal {
    bytes memory _staticData = encodeStatic(system, publicAccess);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, bytes32 resourceSelector, address system, bool publicAccess) internal {
    bytes memory _staticData = encodeStatic(system, publicAccess);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    _store.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * Decode the tightly packed blob of static data using this table's field layout
   * Undefined behaviour for invalid blobs
   */
  function decodeStatic(bytes memory _blob) internal pure returns (address system, bool publicAccess) {
    system = (address(Bytes.slice20(_blob, 0)));

    publicAccess = (_toBool(uint8(Bytes.slice1(_blob, 20))));
  }

  /**
   * Decode the tightly packed blob using this table's field layout.
   * Undefined behaviour for invalid blobs.
   */
  function decode(
    bytes memory _staticData,
    PackedCounter,
    bytes memory
  ) internal pure returns (address system, bool publicAccess) {
    (system, publicAccess) = decodeStatic(_staticData);
  }

  /** Tightly pack static data using this table's schema */
  function encodeStatic(address system, bool publicAccess) internal pure returns (bytes memory) {
    return abi.encodePacked(system, publicAccess);
  }

  /** Tightly pack full data using this table's field layout */
  function encode(address system, bool publicAccess) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(system, publicAccess);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(bytes32 resourceSelector) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 resourceSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    StoreSwitch.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /* Delete all data for given keys */
  function _deleteRecord(bytes32 resourceSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 resourceSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    _store.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }
}

function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}
