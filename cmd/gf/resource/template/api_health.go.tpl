package v1

import (
    "net/http"
    
    "github.com/gin-gonic/gin"
    "{{.ModuleName}}/global"
)

// 健康检查
func HealthCheck(c *gin.Context) {
    db, err := global.GF_DB.DB()
    if err != nil {
        panic(err)
    }
    if err = db.Ping(); err != nil {
        panic(err)
    }
    c.JSON(http.StatusOK, gin.H{
		"code": 0,
		"msg":  "连接正常",
	})
}
