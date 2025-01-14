export async function register() {
	if (process.env.NEXT_RUNTIME === 'nodejs') {}
	
	if (process.env.NEXT_RUNTIME === 'edge') {}
  }

console.log(process.env.NEXT_RUNTIME)