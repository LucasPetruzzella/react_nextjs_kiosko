import { PrismaClient } from "@prisma/client"

export default async function handler(req,res) {
  if(req.method === 'POST'){
    // req.query.id
    const { id } = req.query
    const cliente = new PrismaClient()
    const orderActualizada = await cliente.orden.update({
        where: {
            id: parseInt(id)
        },
        data: {
            completa: true
        }
    })
    res.status(200).json()
  }
}
