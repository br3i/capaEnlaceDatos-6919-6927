const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

async function main() {
  try {
    const ibos = await prisma.iBO.findMany();
    console.log('Conexión exitosa a la base de datos. IBOs:', ibos);
  } catch (error) {
    console.error('Error al conectar con la base de datos:', error);
  } finally {
    await prisma.$disconnect();
  }
}

main();
