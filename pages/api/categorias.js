// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import { PrismaClient } from "@prisma/client"



export default async function handler(req, res) {
  const client = new PrismaClient()
  const categorias = await client.categoria.findMany({
    include: {
      productos: true
    }
  })

  res.status(200).json(categorias)
}
