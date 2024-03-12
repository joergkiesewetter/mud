import { beforeAll, describe, expect, it } from "vitest";
import { createHydratedStore, tables } from "./test/createHydratedStore";
import { deployMockGame, worldAbi } from "../../test/mockGame";
import { writeContract } from "viem/actions";
import { Address, keccak256, parseEther, stringToHex } from "viem";
import { privateKeyToAccount } from "viem/accounts";
import { testClient } from "../../test/common";
import { combineLatest, filter, firstValueFrom, map, scan, shareReplay } from "rxjs";
import { waitForTransaction } from "./test/waitForTransaction";
import { Entity, EntityChange, Has, HasValue, Not, NotValue, defineQuery } from "./queryRECS";

const henryAccount = privateKeyToAccount(keccak256(stringToHex("henry")));

describe("defineQuery", async () => {
  let worldAddress: Address;
  beforeAll(async () => {
    await testClient.setBalance({ address: henryAccount.address, value: parseEther("1") });
    worldAddress = await deployMockGame();
  });

  it("can get players with a position", async () => {
    const { store, fetchLatestLogs } = await createHydratedStore(worldAddress);

    const { update$, matching } = await defineQuery(store, [Has(tables.Position)]);

    const latest$ = combineLatest({
      subjects$: matching.pipe(
        scan((values, value) => [...values, value], [] as readonly (readonly Entity[])[]),
        map((values) => ({ count: values.length, value: values.at(-1) })),
      ),
      subjectChanges$: update$.pipe(
        scan((values, value) => [...values, value], [] as readonly (readonly EntityChange[])[]),
        map((values) => ({ count: values.length, value: values.at(-1) })),
      ),
    }).pipe(shareReplay(1));

    expect(await firstValueFrom(latest$)).toMatchInlineSnapshot(`
      {
        "subjectChanges$": {
          "count": 1,
          "value": [
            {
              "subject": "0x1D96F2f6BeF1202E4Ce1Ff6Dad0c2CB002861d3e",
              "type": "enter",
            },
            {
              "subject": "0x328809Bc894f92807417D2dAD6b7C998c1aFdac6",
              "type": "enter",
            },
            {
              "subject": "0x078cf0753dd50f7C56F20B3Ae02719EA199BE2eb",
              "type": "enter",
            },
            {
              "subject": "0xdBa86119a787422C593ceF119E40887f396024E2",
              "type": "enter",
            },
          ],
        },
        "subjects$": {
          "count": 1,
          "value": [
            "0x1D96F2f6BeF1202E4Ce1Ff6Dad0c2CB002861d3e",
            "0x328809Bc894f92807417D2dAD6b7C998c1aFdac6",
            "0x078cf0753dd50f7C56F20B3Ae02719EA199BE2eb",
            "0xdBa86119a787422C593ceF119E40887f396024E2",
          ],
        },
      }
    `);

    waitForTransaction(
      await writeContract(testClient, {
        account: henryAccount,
        chain: null,
        address: worldAddress,
        abi: worldAbi,
        functionName: "move",
        args: [1, 2],
      }),
    );
    await fetchLatestLogs();

    expect(await firstValueFrom(latest$)).toMatchInlineSnapshot(`
      {
        "subjectChanges$": {
          "count": 2,
          "value": [
            {
              "subject": "0x5f2cC8fb10299751348e1b10f5F1Ba47820B1cB8",
              "type": "enter",
            },
          ],
        },
        "subjects$": {
          "count": 2,
          "value": [
            "0x1D96F2f6BeF1202E4Ce1Ff6Dad0c2CB002861d3e",
            "0x328809Bc894f92807417D2dAD6b7C998c1aFdac6",
            "0x078cf0753dd50f7C56F20B3Ae02719EA199BE2eb",
            "0xdBa86119a787422C593ceF119E40887f396024E2",
            "0x5f2cC8fb10299751348e1b10f5F1Ba47820B1cB8",
          ],
        },
      }
    `);
  });

  it("can get players at position (3, 5)", async () => {
    const { store, fetchLatestLogs } = await createHydratedStore(worldAddress);

    const { update$, matching } = await defineQuery(store, [HasValue(tables.Position, { x: 3, y: 5 })]);

    const latest$ = combineLatest({
      subjects$: matching.pipe(
        scan((values, value) => [...values, value], [] as readonly (readonly Entity[])[]),
        map((values) => ({ count: values.length, value: values.at(-1) })),
      ),
      subjectChanges$: update$.pipe(
        scan((values, value) => [...values, value], [] as readonly (readonly EntityChange[])[]),
        map((values) => ({ count: values.length, value: values.at(-1) })),
      ),
    }).pipe(shareReplay(1));

    expect(await firstValueFrom(latest$)).toMatchInlineSnapshot(`
      {
        "subjectChanges$": {
          "count": 1,
          "value": [
            {
              "subject": "0x328809Bc894f92807417D2dAD6b7C998c1aFdac6",
              "type": "enter",
            },
            {
              "subject": "0x078cf0753dd50f7C56F20B3Ae02719EA199BE2eb",
              "type": "enter",
            },
          ],
        },
        "subjects$": {
          "count": 1,
          "value": [
            "0x328809Bc894f92807417D2dAD6b7C998c1aFdac6",
            "0x078cf0753dd50f7C56F20B3Ae02719EA199BE2eb",
          ],
        },
      }
    `);

    waitForTransaction(
      await writeContract(testClient, {
        account: henryAccount,
        chain: null,
        address: worldAddress,
        abi: worldAbi,
        functionName: "move",
        args: [3, 5],
      }),
    );
    await fetchLatestLogs();

    expect(await firstValueFrom(latest$)).toMatchInlineSnapshot(`
      {
        "subjectChanges$": {
          "count": 2,
          "value": [
            {
              "subject": "0x5f2cC8fb10299751348e1b10f5F1Ba47820B1cB8",
              "type": "enter",
            },
          ],
        },
        "subjects$": {
          "count": 2,
          "value": [
            "0x328809Bc894f92807417D2dAD6b7C998c1aFdac6",
            "0x078cf0753dd50f7C56F20B3Ae02719EA199BE2eb",
            "0x5f2cC8fb10299751348e1b10f5F1Ba47820B1cB8",
          ],
        },
      }
    `);

    waitForTransaction(
      await writeContract(testClient, {
        account: henryAccount,
        chain: null,
        address: worldAddress,
        abi: worldAbi,
        functionName: "move",
        args: [2, 4],
      }),
    );
    await fetchLatestLogs();

    expect(await firstValueFrom(latest$)).toMatchInlineSnapshot(`
      {
        "subjectChanges$": {
          "count": 3,
          "value": [
            {
              "subject": "0x5f2cC8fb10299751348e1b10f5F1Ba47820B1cB8",
              "type": "exit",
            },
          ],
        },
        "subjects$": {
          "count": 3,
          "value": [
            "0x328809Bc894f92807417D2dAD6b7C998c1aFdac6",
            "0x078cf0753dd50f7C56F20B3Ae02719EA199BE2eb",
          ],
        },
      }
    `);
  });

  it("can get players that are still alive", async () => {
    const { store } = await createHydratedStore(worldAddress);

    const { update$, matching } = await defineQuery(store, [
      Has(tables.Position),
      NotValue(tables.Health, { health: 0n }),
    ]);

    const latest$ = combineLatest({
      subjects$: matching.pipe(
        scan((values, value) => [...values, value], [] as readonly (readonly Entity[])[]),
        map((values) => ({ count: values.length, value: values.at(-1) })),
      ),
      subjectChanges$: update$.pipe(
        scan((values, value) => [...values, value], [] as readonly (readonly EntityChange[])[]),
        map((values) => ({ count: values.length, value: values.at(-1) })),
      ),
    }).pipe(shareReplay(1));

    expect(await firstValueFrom(latest$)).toMatchInlineSnapshot(`
      {
        "subjectChanges$": {
          "count": 1,
          "value": [
            {
              "subject": "0x1D96F2f6BeF1202E4Ce1Ff6Dad0c2CB002861d3e",
              "type": "enter",
            },
            {
              "subject": "0x328809Bc894f92807417D2dAD6b7C998c1aFdac6",
              "type": "enter",
            },
          ],
        },
        "subjects$": {
          "count": 1,
          "value": [
            "0x1D96F2f6BeF1202E4Ce1Ff6Dad0c2CB002861d3e",
            "0x328809Bc894f92807417D2dAD6b7C998c1aFdac6",
          ],
        },
      }
    `);
  });

  it("can get all players in grassland", async () => {
    const { store } = await createHydratedStore(worldAddress);

    const { update$, matching } = await defineQuery(store, [HasValue(tables.Terrain, { terrainType: 2 as never })]);

    const latest$ = combineLatest({
      subjects$: matching.pipe(
        scan((values, value) => [...values, value], [] as readonly (readonly Entity[])[]),
        map((values) => ({ count: values.length, value: values.at(-1) })),
      ),
      subjectChanges$: update$.pipe(
        scan((values, value) => [...values, value], [] as readonly (readonly EntityChange[])[]),
        map((values) => ({ count: values.length, value: values.at(-1) })),
      ),
    }).pipe(shareReplay(1));

    expect(await firstValueFrom(latest$)).toMatchInlineSnapshot(`
      {
        "subjectChanges$": {
          "count": 1,
          "value": [
            {
              "subject": "3:5",
              "type": "enter",
            },
          ],
        },
        "subjects$": {
          "count": 1,
          "value": [
            "3:5",
          ],
        },
      }
    `);
  });

  it("can get all players without health (e.g. spectator)", async () => {
    const { store } = await createHydratedStore(worldAddress);

    const { update$, matching } = await defineQuery(store, [Has(tables.Position), Not(tables.Health)]);

    const latest$ = combineLatest({
      subjects$: matching.pipe(
        scan((values, value) => [...values, value], [] as readonly (readonly Entity[])[]),
        map((values) => ({ count: values.length, value: values.at(-1) })),
      ),
      subjectChanges$: update$.pipe(
        scan((values, value) => [...values, value], [] as readonly (readonly EntityChange[])[]),
        map((values) => ({ count: values.length, value: values.at(-1) })),
      ),
    }).pipe(shareReplay(1));

    expect(await firstValueFrom(latest$)).toMatchInlineSnapshot(`
      {
        "subjectChanges$": {
          "count": 1,
          "value": [
            {
              "subject": "0xdBa86119a787422C593ceF119E40887f396024E2",
              "type": "enter",
            },
          ],
        },
        "subjects$": {
          "count": 1,
          "value": [
            "0xdBa86119a787422C593ceF119E40887f396024E2",
          ],
        },
      }
    `);
  });

  it("emits new subjects when initial matching set is empty", async () => {
    const { store, fetchLatestLogs } = await createHydratedStore(worldAddress);

    const { update$, matching } = await defineQuery(store, [HasValue(tables.Position, { x: 999, y: 999 })]);

    const latest$ = combineLatest({
      subjects$: matching.pipe(
        scan((values, value) => [...values, value], [] as readonly (readonly Entity[])[]),
        map((values) => ({ count: values.length, value: values.at(-1) })),
      ),
      subjectChanges$: update$.pipe(
        scan((values, value) => [...values, value], [] as readonly (readonly EntityChange[])[]),
        map((values) => ({ count: values.length, value: values.at(-1) })),
      ),
    }).pipe(shareReplay(1));

    expect(await firstValueFrom(latest$)).toMatchInlineSnapshot(`
      {
        "subjectChanges$": {
          "count": 1,
          "value": [],
        },
        "subjects$": {
          "count": 1,
          "value": [],
        },
      }
    `);

    waitForTransaction(
      await writeContract(testClient, {
        account: henryAccount,
        chain: null,
        address: worldAddress,
        abi: worldAbi,
        functionName: "move",
        args: [999, 999],
      }),
    );
    await fetchLatestLogs();

    expect(await firstValueFrom(latest$)).toMatchInlineSnapshot(`
      {
        "subjectChanges$": {
          "count": 2,
          "value": [
            {
              "subject": "0x5f2cC8fb10299751348e1b10f5F1Ba47820B1cB8",
              "type": "enter",
            },
          ],
        },
        "subjects$": {
          "count": 2,
          "value": [
            "0x5f2cC8fb10299751348e1b10f5F1Ba47820B1cB8",
          ],
        },
      }
    `);
  });

  it("emits changed subjects when subscribing some time after initial query", async () => {
    const { store, fetchLatestLogs } = await createHydratedStore(worldAddress);

    const { update$, matching } = await defineQuery(store, [HasValue(tables.Position, { x: 3, y: 5 })]);

    waitForTransaction(
      await writeContract(testClient, {
        account: henryAccount,
        chain: null,
        address: worldAddress,
        abi: worldAbi,
        functionName: "move",
        args: [3, 5],
      }),
    );
    await fetchLatestLogs();

    const latest$ = combineLatest({
      subjects$: matching.pipe(
        scan((values, value) => [...values, value], [] as readonly (readonly Entity[])[]),
        map((values) => ({ count: values.length, value: values.at(-1) })),
      ),
      subjectChanges$: update$.pipe(
        scan((values, value) => [...values, value], [] as readonly (readonly EntityChange[])[]),
        map((values) => ({ count: values.length, value: values.at(-1) })),
      ),
    }).pipe(shareReplay(1));

    // we expect two emissions for by this point: initial subjects + subjects changed since starting the subscriptions
    expect(
      await firstValueFrom(
        latest$.pipe(filter((latest) => latest.subjects$.count === 2 && latest.subjectChanges$.count === 2)),
      ),
    ).toMatchInlineSnapshot(`
      {
        "subjectChanges$": {
          "count": 2,
          "value": [
            {
              "subject": "0x5f2cC8fb10299751348e1b10f5F1Ba47820B1cB8",
              "type": "enter",
            },
          ],
        },
        "subjects$": {
          "count": 2,
          "value": [
            "0x328809Bc894f92807417D2dAD6b7C998c1aFdac6",
            "0x078cf0753dd50f7C56F20B3Ae02719EA199BE2eb",
            "0x5f2cC8fb10299751348e1b10f5F1Ba47820B1cB8",
          ],
        },
      }
    `);

    waitForTransaction(
      await writeContract(testClient, {
        account: henryAccount,
        chain: null,
        address: worldAddress,
        abi: worldAbi,
        functionName: "move",
        args: [2, 4],
      }),
    );
    await fetchLatestLogs();

    expect(
      await firstValueFrom(
        latest$.pipe(filter((latest) => latest.subjects$.count === 3 && latest.subjectChanges$.count === 3)),
      ),
    ).toMatchInlineSnapshot(`
      {
        "subjectChanges$": {
          "count": 3,
          "value": [
            {
              "subject": "0x5f2cC8fb10299751348e1b10f5F1Ba47820B1cB8",
              "type": "exit",
            },
          ],
        },
        "subjects$": {
          "count": 3,
          "value": [
            "0x328809Bc894f92807417D2dAD6b7C998c1aFdac6",
            "0x078cf0753dd50f7C56F20B3Ae02719EA199BE2eb",
          ],
        },
      }
    `);
  });
});
