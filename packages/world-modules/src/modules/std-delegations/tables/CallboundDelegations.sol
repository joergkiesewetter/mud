// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

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
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { RESOURCE_TABLE, RESOURCE_OFFCHAIN_TABLE } from "@latticexyz/store/src/storeResourceTypes.sol";

// Import user types
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";

ResourceId constant _tableId = ResourceId.wrap(
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14(""), bytes16("CallboundDelegat")))
);
ResourceId constant CallboundDelegationsTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0020010020000000000000000000000000000000000000000000000000000000
);

library CallboundDelegations {
  /**
   * @notice Get the table values' field layout.
   * @return _fieldLayout The field layout for the table.
   */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /**
   * @notice Get the table's key schema.
   * @return _keySchema The key schema for the table.
   */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](4);
    _keySchema[0] = SchemaType.ADDRESS;
    _keySchema[1] = SchemaType.ADDRESS;
    _keySchema[2] = SchemaType.BYTES32;
    _keySchema[3] = SchemaType.BYTES32;

    return SchemaLib.encode(_keySchema);
  }

  /**
   * @notice Get the table's value schema.
   * @return _valueSchema The value schema for the table.
   */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](1);
    _valueSchema[0] = SchemaType.UINT256;

    return SchemaLib.encode(_valueSchema);
  }

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](4);
    keyNames[0] = "delegator";
    keyNames[1] = "delegatee";
    keyNames[2] = "systemId";
    keyNames[3] = "callDataHash";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](1);
    fieldNames[0] = "availableCalls";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get availableCalls.
   */
  function getAvailableCalls(
    address delegator,
    address delegatee,
    ResourceId systemId,
    bytes32 callDataHash
  ) internal view returns (uint256 availableCalls) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));
    _keyTuple[2] = ResourceId.unwrap(systemId);
    _keyTuple[3] = callDataHash;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get availableCalls.
   */
  function _getAvailableCalls(
    address delegator,
    address delegatee,
    ResourceId systemId,
    bytes32 callDataHash
  ) internal view returns (uint256 availableCalls) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));
    _keyTuple[2] = ResourceId.unwrap(systemId);
    _keyTuple[3] = callDataHash;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get availableCalls.
   */
  function get(
    address delegator,
    address delegatee,
    ResourceId systemId,
    bytes32 callDataHash
  ) internal view returns (uint256 availableCalls) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));
    _keyTuple[2] = ResourceId.unwrap(systemId);
    _keyTuple[3] = callDataHash;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get availableCalls.
   */
  function _get(
    address delegator,
    address delegatee,
    ResourceId systemId,
    bytes32 callDataHash
  ) internal view returns (uint256 availableCalls) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));
    _keyTuple[2] = ResourceId.unwrap(systemId);
    _keyTuple[3] = callDataHash;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Set availableCalls.
   */
  function setAvailableCalls(
    address delegator,
    address delegatee,
    ResourceId systemId,
    bytes32 callDataHash,
    uint256 availableCalls
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));
    _keyTuple[2] = ResourceId.unwrap(systemId);
    _keyTuple[3] = callDataHash;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((availableCalls)), _fieldLayout);
  }

  /**
   * @notice Set availableCalls.
   */
  function _setAvailableCalls(
    address delegator,
    address delegatee,
    ResourceId systemId,
    bytes32 callDataHash,
    uint256 availableCalls
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));
    _keyTuple[2] = ResourceId.unwrap(systemId);
    _keyTuple[3] = callDataHash;

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((availableCalls)), _fieldLayout);
  }

  /**
   * @notice Set availableCalls.
   */
  function set(
    address delegator,
    address delegatee,
    ResourceId systemId,
    bytes32 callDataHash,
    uint256 availableCalls
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));
    _keyTuple[2] = ResourceId.unwrap(systemId);
    _keyTuple[3] = callDataHash;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((availableCalls)), _fieldLayout);
  }

  /**
   * @notice Set availableCalls.
   */
  function _set(
    address delegator,
    address delegatee,
    ResourceId systemId,
    bytes32 callDataHash,
    uint256 availableCalls
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));
    _keyTuple[2] = ResourceId.unwrap(systemId);
    _keyTuple[3] = callDataHash;

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((availableCalls)), _fieldLayout);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(address delegator, address delegatee, ResourceId systemId, bytes32 callDataHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));
    _keyTuple[2] = ResourceId.unwrap(systemId);
    _keyTuple[3] = callDataHash;

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(address delegator, address delegatee, ResourceId systemId, bytes32 callDataHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));
    _keyTuple[2] = ResourceId.unwrap(systemId);
    _keyTuple[3] = callDataHash;

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(uint256 availableCalls) internal pure returns (bytes memory) {
    return abi.encodePacked(availableCalls);
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(uint256 availableCalls) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(availableCalls);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(
    address delegator,
    address delegatee,
    ResourceId systemId,
    bytes32 callDataHash
  ) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));
    _keyTuple[2] = ResourceId.unwrap(systemId);
    _keyTuple[3] = callDataHash;

    return _keyTuple;
  }
}
