# Demo FastAPI app (參考用，不參與本次部署鏡像)
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello from FastAPI (local only, not deployed in k8s image)"}    
