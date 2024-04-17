import { resourceToHex } from "@latticexyz/common";
import { ENTRYPOINT_ADDRESS_V07, SmartAccountClient } from "permissionless";
import { SmartAccount } from "permissionless/accounts";
import { Chain, Transport } from "viem";

export const entryPointAddress = ENTRYPOINT_ADDRESS_V07;
/**
 * `deposits` storage variable position in the entry point contract,
 * used to override contract state when doing paymaster gas estimation.
 */
export const entryPointDepositsSlot = 0n;

export type AppAccount = SmartAccount<typeof entryPointAddress>;
export type AppAccountClient = SmartAccountClient<typeof entryPointAddress, Transport, Chain, AppAccount>;

export const smartAccountFactory = "0x91E60e0613810449d098b0b5Ec8b51A0FE8c8985";

export const unlimitedDelegationControlId = resourceToHex({ type: "system", namespace: "", name: "unlimited" });