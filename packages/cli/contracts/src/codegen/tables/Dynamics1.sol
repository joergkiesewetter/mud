// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema } from "@latticexyz/store/src/Schema.sol";
import { EncodedLengths, EncodedLengthsLib } from "@latticexyz/store/src/EncodedLengths.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";

struct Dynamics1Data {
  bytes32[1] staticB32;
  int32[2] staticI32;
  uint128[3] staticU128;
  address[4] staticAddrs;
  bool[5] staticBools;
}

library Dynamics1 {
  // Hex below is the result of `WorldResourceIdLib.encode({ namespace: "", name: "Dynamics1", typeId: RESOURCE_TABLE });`
  ResourceId constant _tableId = ResourceId.wrap(0x7462000000000000000000000000000044796e616d6963733100000000000000);

  FieldLayout constant _fieldLayout =
    FieldLayout.wrap(0x0000000500000000000000000000000000000000000000000000000000000000);

  // Hex-encoded key schema of (bytes32)
  Schema constant _keySchema = Schema.wrap(0x002001005f000000000000000000000000000000000000000000000000000000);
  // Hex-encoded value schema of (bytes32[], int32[], uint128[], address[], bool[])
  Schema constant _valueSchema = Schema.wrap(0x00000005c18571c3c20000000000000000000000000000000000000000000000);

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "key";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](5);
    fieldNames[0] = "staticB32";
    fieldNames[1] = "staticI32";
    fieldNames[2] = "staticU128";
    fieldNames[3] = "staticAddrs";
    fieldNames[4] = "staticBools";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get staticB32.
   */
  function getStaticB32(bytes32 key) internal view returns (bytes32[1] memory staticB32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return toStaticArray_bytes32_1(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Get staticB32.
   */
  function _getStaticB32(bytes32 key) internal view returns (bytes32[1] memory staticB32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return toStaticArray_bytes32_1(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Set staticB32.
   */
  function setStaticB32(bytes32 key, bytes32[1] memory staticB32) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode(fromStaticArray_bytes32_1(staticB32)));
  }

  /**
   * @notice Set staticB32.
   */
  function _setStaticB32(bytes32 key, bytes32[1] memory staticB32) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode(fromStaticArray_bytes32_1(staticB32)));
  }

  // The length of staticB32
  uint256 constant lengthStaticB32 = 1;

  /**
   * @notice Get an item of staticB32.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemStaticB32(bytes32 key, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Get an item of staticB32.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemStaticB32(bytes32 key, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Update an element of staticB32 at `_index`.
   */
  function updateStaticB32(bytes32 key, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of staticB32 at `_index`.
   */
  function _updateStaticB32(bytes32 key, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get staticI32.
   */
  function getStaticI32(bytes32 key) internal view returns (int32[2] memory staticI32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 1);
    return toStaticArray_int32_2(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_int32());
  }

  /**
   * @notice Get staticI32.
   */
  function _getStaticI32(bytes32 key) internal view returns (int32[2] memory staticI32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 1);
    return toStaticArray_int32_2(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_int32());
  }

  /**
   * @notice Set staticI32.
   */
  function setStaticI32(bytes32 key, int32[2] memory staticI32) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 1, EncodeArray.encode(fromStaticArray_int32_2(staticI32)));
  }

  /**
   * @notice Set staticI32.
   */
  function _setStaticI32(bytes32 key, int32[2] memory staticI32) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.setDynamicField(_tableId, _keyTuple, 1, EncodeArray.encode(fromStaticArray_int32_2(staticI32)));
  }

  // The length of staticI32
  uint256 constant lengthStaticI32 = 2;

  /**
   * @notice Get an item of staticI32.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemStaticI32(bytes32 key, uint256 _index) internal view returns (int32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 4, (_index + 1) * 4);
      return (int32(uint32(bytes4(_blob))));
    }
  }

  /**
   * @notice Get an item of staticI32.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemStaticI32(bytes32 key, uint256 _index) internal view returns (int32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 4, (_index + 1) * 4);
      return (int32(uint32(bytes4(_blob))));
    }
  }

  /**
   * @notice Update an element of staticI32 at `_index`.
   */
  function updateStaticI32(bytes32 key, uint256 _index, int32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 4), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of staticI32 at `_index`.
   */
  function _updateStaticI32(bytes32 key, uint256 _index, int32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 4), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get staticU128.
   */
  function getStaticU128(bytes32 key) internal view returns (uint128[3] memory staticU128) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 2);
    return toStaticArray_uint128_3(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint128());
  }

  /**
   * @notice Get staticU128.
   */
  function _getStaticU128(bytes32 key) internal view returns (uint128[3] memory staticU128) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 2);
    return toStaticArray_uint128_3(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint128());
  }

  /**
   * @notice Set staticU128.
   */
  function setStaticU128(bytes32 key, uint128[3] memory staticU128) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 2, EncodeArray.encode(fromStaticArray_uint128_3(staticU128)));
  }

  /**
   * @notice Set staticU128.
   */
  function _setStaticU128(bytes32 key, uint128[3] memory staticU128) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.setDynamicField(_tableId, _keyTuple, 2, EncodeArray.encode(fromStaticArray_uint128_3(staticU128)));
  }

  // The length of staticU128
  uint256 constant lengthStaticU128 = 3;

  /**
   * @notice Get an item of staticU128.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemStaticU128(bytes32 key, uint256 _index) internal view returns (uint128) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 2, _index * 16, (_index + 1) * 16);
      return (uint128(bytes16(_blob)));
    }
  }

  /**
   * @notice Get an item of staticU128.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemStaticU128(bytes32 key, uint256 _index) internal view returns (uint128) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 2, _index * 16, (_index + 1) * 16);
      return (uint128(bytes16(_blob)));
    }
  }

  /**
   * @notice Update an element of staticU128 at `_index`.
   */
  function updateStaticU128(bytes32 key, uint256 _index, uint128 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 2, uint40(_index * 16), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of staticU128 at `_index`.
   */
  function _updateStaticU128(bytes32 key, uint256 _index, uint128 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 2, uint40(_index * 16), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get staticAddrs.
   */
  function getStaticAddrs(bytes32 key) internal view returns (address[4] memory staticAddrs) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 3);
    return toStaticArray_address_4(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_address());
  }

  /**
   * @notice Get staticAddrs.
   */
  function _getStaticAddrs(bytes32 key) internal view returns (address[4] memory staticAddrs) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 3);
    return toStaticArray_address_4(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_address());
  }

  /**
   * @notice Set staticAddrs.
   */
  function setStaticAddrs(bytes32 key, address[4] memory staticAddrs) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 3, EncodeArray.encode(fromStaticArray_address_4(staticAddrs)));
  }

  /**
   * @notice Set staticAddrs.
   */
  function _setStaticAddrs(bytes32 key, address[4] memory staticAddrs) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.setDynamicField(_tableId, _keyTuple, 3, EncodeArray.encode(fromStaticArray_address_4(staticAddrs)));
  }

  // The length of staticAddrs
  uint256 constant lengthStaticAddrs = 4;

  /**
   * @notice Get an item of staticAddrs.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemStaticAddrs(bytes32 key, uint256 _index) internal view returns (address) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 3, _index * 20, (_index + 1) * 20);
      return (address(bytes20(_blob)));
    }
  }

  /**
   * @notice Get an item of staticAddrs.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemStaticAddrs(bytes32 key, uint256 _index) internal view returns (address) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 3, _index * 20, (_index + 1) * 20);
      return (address(bytes20(_blob)));
    }
  }

  /**
   * @notice Update an element of staticAddrs at `_index`.
   */
  function updateStaticAddrs(bytes32 key, uint256 _index, address _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 3, uint40(_index * 20), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of staticAddrs at `_index`.
   */
  function _updateStaticAddrs(bytes32 key, uint256 _index, address _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 3, uint40(_index * 20), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get staticBools.
   */
  function getStaticBools(bytes32 key) internal view returns (bool[5] memory staticBools) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 4);
    return toStaticArray_bool_5(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bool());
  }

  /**
   * @notice Get staticBools.
   */
  function _getStaticBools(bytes32 key) internal view returns (bool[5] memory staticBools) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 4);
    return toStaticArray_bool_5(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bool());
  }

  /**
   * @notice Set staticBools.
   */
  function setStaticBools(bytes32 key, bool[5] memory staticBools) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 4, EncodeArray.encode(fromStaticArray_bool_5(staticBools)));
  }

  /**
   * @notice Set staticBools.
   */
  function _setStaticBools(bytes32 key, bool[5] memory staticBools) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.setDynamicField(_tableId, _keyTuple, 4, EncodeArray.encode(fromStaticArray_bool_5(staticBools)));
  }

  // The length of staticBools
  uint256 constant lengthStaticBools = 5;

  /**
   * @notice Get an item of staticBools.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemStaticBools(bytes32 key, uint256 _index) internal view returns (bool) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 4, _index * 1, (_index + 1) * 1);
      return (_toBool(uint8(bytes1(_blob))));
    }
  }

  /**
   * @notice Get an item of staticBools.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemStaticBools(bytes32 key, uint256 _index) internal view returns (bool) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 4, _index * 1, (_index + 1) * 1);
      return (_toBool(uint8(bytes1(_blob))));
    }
  }

  /**
   * @notice Update an element of staticBools at `_index`.
   */
  function updateStaticBools(bytes32 key, uint256 _index, bool _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 4, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of staticBools at `_index`.
   */
  function _updateStaticBools(bytes32 key, uint256 _index, bool _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 4, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get the full data.
   */
  function get(bytes32 key) internal view returns (Dynamics1Data memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    (bytes memory _staticData, EncodedLengths _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(bytes32 key) internal view returns (Dynamics1Data memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    (bytes memory _staticData, EncodedLengths _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(
    bytes32 key,
    bytes32[1] memory staticB32,
    int32[2] memory staticI32,
    uint128[3] memory staticU128,
    address[4] memory staticAddrs,
    bool[5] memory staticBools
  ) internal {
    bytes memory _staticData;
    EncodedLengths _encodedLengths = encodeLengths(staticB32, staticI32, staticU128, staticAddrs, staticBools);
    bytes memory _dynamicData = encodeDynamic(staticB32, staticI32, staticU128, staticAddrs, staticBools);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(
    bytes32 key,
    bytes32[1] memory staticB32,
    int32[2] memory staticI32,
    uint128[3] memory staticU128,
    address[4] memory staticAddrs,
    bool[5] memory staticBools
  ) internal {
    bytes memory _staticData;
    EncodedLengths _encodedLengths = encodeLengths(staticB32, staticI32, staticU128, staticAddrs, staticBools);
    bytes memory _dynamicData = encodeDynamic(staticB32, staticI32, staticU128, staticAddrs, staticBools);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(bytes32 key, Dynamics1Data memory _table) internal {
    bytes memory _staticData;
    EncodedLengths _encodedLengths = encodeLengths(
      _table.staticB32,
      _table.staticI32,
      _table.staticU128,
      _table.staticAddrs,
      _table.staticBools
    );
    bytes memory _dynamicData = encodeDynamic(
      _table.staticB32,
      _table.staticI32,
      _table.staticU128,
      _table.staticAddrs,
      _table.staticBools
    );

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(bytes32 key, Dynamics1Data memory _table) internal {
    bytes memory _staticData;
    EncodedLengths _encodedLengths = encodeLengths(
      _table.staticB32,
      _table.staticI32,
      _table.staticU128,
      _table.staticAddrs,
      _table.staticBools
    );
    bytes memory _dynamicData = encodeDynamic(
      _table.staticB32,
      _table.staticI32,
      _table.staticU128,
      _table.staticAddrs,
      _table.staticBools
    );

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of dynamic data using the encoded lengths.
   */
  function decodeDynamic(
    EncodedLengths _encodedLengths,
    bytes memory _blob
  )
    internal
    pure
    returns (
      bytes32[1] memory staticB32,
      int32[2] memory staticI32,
      uint128[3] memory staticU128,
      address[4] memory staticAddrs,
      bool[5] memory staticBools
    )
  {
    uint256 _start;
    uint256 _end;
    unchecked {
      _end = _encodedLengths.atIndex(0);
    }
    staticB32 = toStaticArray_bytes32_1(SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());

    _start = _end;
    unchecked {
      _end += _encodedLengths.atIndex(1);
    }
    staticI32 = toStaticArray_int32_2(SliceLib.getSubslice(_blob, _start, _end).decodeArray_int32());

    _start = _end;
    unchecked {
      _end += _encodedLengths.atIndex(2);
    }
    staticU128 = toStaticArray_uint128_3(SliceLib.getSubslice(_blob, _start, _end).decodeArray_uint128());

    _start = _end;
    unchecked {
      _end += _encodedLengths.atIndex(3);
    }
    staticAddrs = toStaticArray_address_4(SliceLib.getSubslice(_blob, _start, _end).decodeArray_address());

    _start = _end;
    unchecked {
      _end += _encodedLengths.atIndex(4);
    }
    staticBools = toStaticArray_bool_5(SliceLib.getSubslice(_blob, _start, _end).decodeArray_bool());
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   *
   * @param _encodedLengths Encoded lengths of dynamic fields.
   * @param _dynamicData Tightly packed dynamic fields.
   */
  function decode(
    bytes memory,
    EncodedLengths _encodedLengths,
    bytes memory _dynamicData
  ) internal pure returns (Dynamics1Data memory _table) {
    (_table.staticB32, _table.staticI32, _table.staticU128, _table.staticAddrs, _table.staticBools) = decodeDynamic(
      _encodedLengths,
      _dynamicData
    );
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack dynamic data lengths using this table's schema.
   * @return _encodedLengths The lengths of the dynamic fields (packed into a single bytes32 value).
   */
  function encodeLengths(
    bytes32[1] memory staticB32,
    int32[2] memory staticI32,
    uint128[3] memory staticU128,
    address[4] memory staticAddrs,
    bool[5] memory staticBools
  ) internal pure returns (EncodedLengths _encodedLengths) {
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = EncodedLengthsLib.pack(
        staticB32.length * 32,
        staticI32.length * 4,
        staticU128.length * 16,
        staticAddrs.length * 20,
        staticBools.length * 1
      );
    }
  }

  /**
   * @notice Tightly pack dynamic (variable length) data using this table's schema.
   * @return The dynamic data, encoded into a sequence of bytes.
   */
  function encodeDynamic(
    bytes32[1] memory staticB32,
    int32[2] memory staticI32,
    uint128[3] memory staticU128,
    address[4] memory staticAddrs,
    bool[5] memory staticBools
  ) internal pure returns (bytes memory) {
    return
      abi.encodePacked(
        EncodeArray.encode(fromStaticArray_bytes32_1(staticB32)),
        EncodeArray.encode(fromStaticArray_int32_2(staticI32)),
        EncodeArray.encode(fromStaticArray_uint128_3(staticU128)),
        EncodeArray.encode(fromStaticArray_address_4(staticAddrs)),
        EncodeArray.encode(fromStaticArray_bool_5(staticBools))
      );
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    bytes32[1] memory staticB32,
    int32[2] memory staticI32,
    uint128[3] memory staticU128,
    address[4] memory staticAddrs,
    bool[5] memory staticBools
  ) internal pure returns (bytes memory, EncodedLengths, bytes memory) {
    bytes memory _staticData;
    EncodedLengths _encodedLengths = encodeLengths(staticB32, staticI32, staticU128, staticAddrs, staticBools);
    bytes memory _dynamicData = encodeDynamic(staticB32, staticI32, staticU128, staticAddrs, staticBools);

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(bytes32 key) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    return _keyTuple;
  }
}

/**
 * @notice Cast a dynamic array to a static array.
 * @dev In memory static arrays are just dynamic arrays without the 32 length bytes,
 * so this function moves the pointer to the first element of the dynamic array.
 * If the length of the dynamic array is smaller than the static length,
 * the function returns an uninitialized array to avoid memory corruption.
 * @param _value The dynamic array to cast.
 * @return _result The static array.
 */
function toStaticArray_bytes32_1(bytes32[] memory _value) pure returns (bytes32[1] memory _result) {
  if (_value.length < 1) {
    // return an uninitialized array if the length is smaller than the fixed length to avoid memory corruption
    return _result;
  } else {
    // in memory static arrays are just dynamic arrays without the 32 length bytes
    // (without the length check this could lead to memory corruption)
    assembly {
      _result := add(_value, 0x20)
    }
  }
}

/**
 * @notice Cast a dynamic array to a static array.
 * @dev In memory static arrays are just dynamic arrays without the 32 length bytes,
 * so this function moves the pointer to the first element of the dynamic array.
 * If the length of the dynamic array is smaller than the static length,
 * the function returns an uninitialized array to avoid memory corruption.
 * @param _value The dynamic array to cast.
 * @return _result The static array.
 */
function toStaticArray_int32_2(int32[] memory _value) pure returns (int32[2] memory _result) {
  if (_value.length < 2) {
    // return an uninitialized array if the length is smaller than the fixed length to avoid memory corruption
    return _result;
  } else {
    // in memory static arrays are just dynamic arrays without the 32 length bytes
    // (without the length check this could lead to memory corruption)
    assembly {
      _result := add(_value, 0x20)
    }
  }
}

/**
 * @notice Cast a dynamic array to a static array.
 * @dev In memory static arrays are just dynamic arrays without the 32 length bytes,
 * so this function moves the pointer to the first element of the dynamic array.
 * If the length of the dynamic array is smaller than the static length,
 * the function returns an uninitialized array to avoid memory corruption.
 * @param _value The dynamic array to cast.
 * @return _result The static array.
 */
function toStaticArray_uint128_3(uint128[] memory _value) pure returns (uint128[3] memory _result) {
  if (_value.length < 3) {
    // return an uninitialized array if the length is smaller than the fixed length to avoid memory corruption
    return _result;
  } else {
    // in memory static arrays are just dynamic arrays without the 32 length bytes
    // (without the length check this could lead to memory corruption)
    assembly {
      _result := add(_value, 0x20)
    }
  }
}

/**
 * @notice Cast a dynamic array to a static array.
 * @dev In memory static arrays are just dynamic arrays without the 32 length bytes,
 * so this function moves the pointer to the first element of the dynamic array.
 * If the length of the dynamic array is smaller than the static length,
 * the function returns an uninitialized array to avoid memory corruption.
 * @param _value The dynamic array to cast.
 * @return _result The static array.
 */
function toStaticArray_address_4(address[] memory _value) pure returns (address[4] memory _result) {
  if (_value.length < 4) {
    // return an uninitialized array if the length is smaller than the fixed length to avoid memory corruption
    return _result;
  } else {
    // in memory static arrays are just dynamic arrays without the 32 length bytes
    // (without the length check this could lead to memory corruption)
    assembly {
      _result := add(_value, 0x20)
    }
  }
}

/**
 * @notice Cast a dynamic array to a static array.
 * @dev In memory static arrays are just dynamic arrays without the 32 length bytes,
 * so this function moves the pointer to the first element of the dynamic array.
 * If the length of the dynamic array is smaller than the static length,
 * the function returns an uninitialized array to avoid memory corruption.
 * @param _value The dynamic array to cast.
 * @return _result The static array.
 */
function toStaticArray_bool_5(bool[] memory _value) pure returns (bool[5] memory _result) {
  if (_value.length < 5) {
    // return an uninitialized array if the length is smaller than the fixed length to avoid memory corruption
    return _result;
  } else {
    // in memory static arrays are just dynamic arrays without the 32 length bytes
    // (without the length check this could lead to memory corruption)
    assembly {
      _result := add(_value, 0x20)
    }
  }
}

/**
 * @notice Copy a static array to a dynamic array.
 * @dev Static arrays don't have a length prefix, so this function copies the memory from the static array to a new dynamic array.
 * @param _value The static array to copy.
 * @return _result The dynamic array.
 */
function fromStaticArray_bytes32_1(bytes32[1] memory _value) pure returns (bytes32[] memory _result) {
  _result = new bytes32[](1);
  uint256 fromPointer;
  uint256 toPointer;
  assembly {
    fromPointer := _value
    toPointer := add(_result, 0x20)
  }
  Memory.copy(fromPointer, toPointer, 32);
}

/**
 * @notice Copy a static array to a dynamic array.
 * @dev Static arrays don't have a length prefix, so this function copies the memory from the static array to a new dynamic array.
 * @param _value The static array to copy.
 * @return _result The dynamic array.
 */
function fromStaticArray_int32_2(int32[2] memory _value) pure returns (int32[] memory _result) {
  _result = new int32[](2);
  uint256 fromPointer;
  uint256 toPointer;
  assembly {
    fromPointer := _value
    toPointer := add(_result, 0x20)
  }
  Memory.copy(fromPointer, toPointer, 64);
}

/**
 * @notice Copy a static array to a dynamic array.
 * @dev Static arrays don't have a length prefix, so this function copies the memory from the static array to a new dynamic array.
 * @param _value The static array to copy.
 * @return _result The dynamic array.
 */
function fromStaticArray_uint128_3(uint128[3] memory _value) pure returns (uint128[] memory _result) {
  _result = new uint128[](3);
  uint256 fromPointer;
  uint256 toPointer;
  assembly {
    fromPointer := _value
    toPointer := add(_result, 0x20)
  }
  Memory.copy(fromPointer, toPointer, 96);
}

/**
 * @notice Copy a static array to a dynamic array.
 * @dev Static arrays don't have a length prefix, so this function copies the memory from the static array to a new dynamic array.
 * @param _value The static array to copy.
 * @return _result The dynamic array.
 */
function fromStaticArray_address_4(address[4] memory _value) pure returns (address[] memory _result) {
  _result = new address[](4);
  uint256 fromPointer;
  uint256 toPointer;
  assembly {
    fromPointer := _value
    toPointer := add(_result, 0x20)
  }
  Memory.copy(fromPointer, toPointer, 128);
}

/**
 * @notice Copy a static array to a dynamic array.
 * @dev Static arrays don't have a length prefix, so this function copies the memory from the static array to a new dynamic array.
 * @param _value The static array to copy.
 * @return _result The dynamic array.
 */
function fromStaticArray_bool_5(bool[5] memory _value) pure returns (bool[] memory _result) {
  _result = new bool[](5);
  uint256 fromPointer;
  uint256 toPointer;
  assembly {
    fromPointer := _value
    toPointer := add(_result, 0x20)
  }
  Memory.copy(fromPointer, toPointer, 160);
}

/**
 * @notice Cast a value to a bool.
 * @dev Boolean values are encoded as uint8 (1 = true, 0 = false), but Solidity doesn't allow casting between uint8 and bool.
 * @param value The uint8 value to convert.
 * @return result The boolean value.
 */
function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}
