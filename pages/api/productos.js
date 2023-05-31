// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import { PrismaClient } from "@prisma/client"



export default async function handler(req, res) {
  const client = new PrismaClient()
  const productos = await client.producto.findMany()

  res.status(200).json(productos)
}
