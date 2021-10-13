# Graduation Thesis
## 실험방법
### 실험 1)
Workload 실행 후 grep ANON 등으로 page 할당 상태 관찰<br/>
workload의 예) XSBench -t 4 -g 60000 -p 9000000 <br/>

### 실험 2)
Linux ThP의 enabled,defrag 옵션 활성화<br/>
filebench 와 XSBench 동시 실행<br/>
*filebench의 workload 중 fileserver.f 수정 - runtime>=300s, 전체 워크로드 크기 15GB 이상*<br/>
실험 2-1) fileserver.f 실행 후 XSBench 실행<br/>
실험 2-2) XSBench 실행 후 fileserver.f 실행<br/>

### 실험 3) 
fileserver runtime >= 600s, 전체 워크로드 크기 30GB<br/>
실험 3-1, 3-2는 실험 2-1, 2-2와 동일하게 진행<br/>

### 실험 4)
Linux THP의 defrag 옵션 always/defer 두 가지로 실험<br/>
실험 4-1) defrag 옵션 [always]로 설정해 filebench 실행 후 XSBench 실행<br/>
실험 4-2) defrag 옵션 [defer]로 설정해 위와 동일한 순서로 실행<br/>

#### Linux THP의 defrag option
 direct compactiond을 조절하는 옵션으로 huge page 할당동안 synchronous memory compaction을 수행한다. <br/>
 이를 비활성화하면 메모리 절약에는 비효율적일 수 있으나 page fault 시 발생하는latency를 줄일 수 있다. <br/>
