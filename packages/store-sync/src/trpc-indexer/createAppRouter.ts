import { z } from "zod";
import { StorageAdapter } from "./common";
import { initTRPC } from "@trpc/server";
import superjson from "superjson";
import fastify from "fastify";
import { TRPCPanelMeta, renderTrpcPanel } from "trpc-panel";
import { Address } from "abitype/zod";
import { fastifyTRPCPlugin } from "@trpc/server/adapters/fastify";

// TODO replace createAppRouter with this
// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
export const createServer = (url: string) => {
  const t = initTRPC.meta<TRPCPanelMeta>().context<{ storageAdapter: StorageAdapter }>().create({
    transformer: superjson,
  });
  const router = t.router({
    findAll: t.procedure
      .meta({
        description: "Returns all the TODOs for a TODO contract",
      })
      .input(
        z
          .object({
            chainId: z.number().describe("Chain ID, e.g. 1 for Ethereum mainnet"),
            address: Address.describe("Contract address of the TODO"),
          })
          .describe("Location of the TODO contract")
      )
      .query(async (opts): ReturnType<StorageAdapter["findAll"]> => {
        const { storageAdapter } = opts.ctx;
        const { chainId, address } = opts.input;
        return storageAdapter.findAll(chainId, address);
      }),
  });
  const server = fastify({
    maxParamLength: 5000,
    logger: true,
  });
  server.register(fastifyTRPCPlugin, {
    prefix: "/",
    trpcOptions: { router },
  });
  server.get("/playground", (_, res) => {
    return res.send(renderTrpcPanel(router, { url, transformer: "superjson" }));
  });
  return server;
  // TODO delete just here for own reference
  // Run the server!
  // try {
  //  await server.listen({ port: 3000 })
  // } catch (err) {
  //   server.log.error(err)
  //  process.exit(1)
  // }
};

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
export function createAppRouter() {
  const t = initTRPC.context<{ storageAdapter: StorageAdapter }>().create({
    transformer: superjson,
  });

  return t.router({
    findAll: t.procedure
      .input(
        z
          .object({
            chainId: z.number().describe("Chain ID, e.g. 1 for Ethereum mainnet"),
            address: Address.describe("Contract address of the TODO"),
          })
          .describe("Returns all the TODOs for a TODO contract")
      )
      .query(async (opts): ReturnType<StorageAdapter["findAll"]> => {
        const { storageAdapter } = opts.ctx;
        const { chainId, address } = opts.input;
        return storageAdapter.findAll(chainId, address);
      }),
  });
}

export type AppRouter = ReturnType<typeof createAppRouter>;
