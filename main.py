from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get("/")
def read_root():
    """
        Just Hello
    """
    return {"Hello": "World"}


if __name__ == "__main__":
    print("Ventesim started..")
    uvicorn.run("main:app", host="0.0.0.0", port=8080, reload=True, workers=2)

