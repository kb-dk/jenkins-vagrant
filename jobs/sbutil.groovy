job(type: Maven) {
    name 'SButil'
    description 'This is the sbutil helpful java library'
    concurrentBuild true
    scm {
        git {
                remote{
                        url('https://github.com/statsbiblioteket/sbutil')
                }
        }
    }
    triggers {
        snapshotDependencies(true)
        githubPush()
    }
    jdk('java7')
  
    mavenInstallation('maven3')
    goals('clean')
    goals('install')
   
}

