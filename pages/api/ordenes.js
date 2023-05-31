// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import { PrismaClient } from "@prisma/client"



export default async function handler(req, res) {
    const client = new PrismaClient()

    if(req.method === 'GET'){
        const ordenes = await client.orden.findMany({
            where: {
                completa: false
            }
        })

        res.status(200).json(ordenes)
    }

    if(req.method === 'POST'){
        const orden = await client.orden.create({
            data: {
                nombre: req.body.nombre,
                total: req.body.total,
                pedido: req.body.pedido,
                fecha: req.body.fecha
            }
        })
      
        res.status(200).json(orden)

    }
  
}
