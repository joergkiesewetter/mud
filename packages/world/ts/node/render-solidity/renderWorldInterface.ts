import {
  renderArguments,
  renderedSolidityHeader,
  renderAbsoluteImports,
  renderRelativeImports,
  type AbsoluteImportDatum,
} from "@latticexyz/common/codegen";
import type { RenderWorldOptions } from "./types";

export function renderWorldInterface(options: RenderWorldOptions) {
  const { interfaceName, storeImportPath, worldImportPath, imports } = options;
  const baseImports: AbsoluteImportDatum[] =
    interfaceName === "IBaseWorld"
      ? [
          { symbol: "IStore", path: `${storeImportPath}IStore.sol` },
          { symbol: "IWorldKernel", path: `${worldImportPath}IWorldKernel.sol` },
        ]
      : [
          {
            symbol: "IBaseWorld",
            path: `${worldImportPath}codegen/interfaces/IBaseWorld.sol`,
          },
        ];
  const importSymbols = [...baseImports, ...imports].map(({ symbol }) => symbol);

  return `
    ${renderedSolidityHeader}

    ${renderAbsoluteImports(baseImports)}

    ${renderRelativeImports(imports)}

    /**
     * @title ${interfaceName}
     * @notice This interface integrates all systems and associated function selectors 
     * that are dynamically registered in the World during deployment.
     * @dev This is an autogenerated file; do not edit manually.
     */
    interface ${interfaceName} is ${renderArguments(importSymbols)} {
    }
  `;
}