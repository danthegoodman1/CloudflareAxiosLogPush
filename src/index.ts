export interface Env {
	TOKEN: string
	DATASET: string
}

export default {
	async fetch(
		request: Request,
		env: Env,
		ctx: ExecutionContext
	): Promise<Response> {
		if (request.headers.get("content-length") === "4") {
			console.log("got test")
			return new Response("f u test")
		}
		if (request.headers.get("content-encoding") === "gzip") {
			// This is a logpush batch
			console.log("got logs")

			// Verify token
			if (request.headers.get("Authorization")?.split("earer ")[1] !== env.TOKEN) {
				return new Response("invalid token", {
					status: 401
				})
			}

			return fetch(`https://cloud.axiom.co/api/v1/datasets/${env.DATASET}/ingest`, {
				method: "POST",
				headers: {
					"Authorization": `Bearer: ${env.TOKEN}`,
					"content-encoding": "gzip",
					"content-type": "application/json"
				},
				body: request.body
			})
		}
		return new Response("ok")
	},
}
