<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
	
    <!-- JS Implementing Plugins -->
    <script src="assets/vendor/hs-mega-menu/dist/hs-mega-menu.min.js"></script>

    <!-- JS Plugins Init. -->
    <script>
        (function() {
            // INITIALIZATION OF MEGA MENU
            // =======================================================
            new HSMegaMenu('.js-mega-menu', {
                desktop: {
                    position: 'left'
                }
            })
        })()
    </script>
    <!-- JS Global Compulsory  -->
    <script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JS Implementing Plugins -->
    <script src="assets/vendor/hs-go-to/dist/hs-go-to.min.js"></script>
    <script src="assets/vendor/prism/prism.js"></script>
    <script src="assets/vendor/hs-mega-menu/dist/hs-mega-menu.min.js"></script>
    <script src="assets/vendor/typed.js/lib/typed.min.js"></script>

    <!-- JS Front -->
    <script src="assets/js/theme.min.js"></script>

    <!-- ========== END HEADER ========== -->


    <!-- START CONTENTS-->


    <!-- Form Card -->
    <div class="container content-space-2 content-space-lg-3">
        <div class="w-lg-75 mx-lg-auto">
            <!-- Heading -->
            <div class="text-center mb-5">
                <h2 class="card-title">나눔 게시판</h2>
            </div>
            <!-- End Heading -->

            <!-- Card -->
            <div class="card card-bordered shadow-none">
                <div class="card-body">
                    <!-- Form -->
                    <form>

                        <!-- Form -->
                        <div class="row mb-4">
                            <label for="submitAppProjectName" class="col-sm-3 col-form-label">제목</label>
                            <div class="col-sm-9">
                                <p>제목</p>
                            </div>
                        </div>
                        <!-- End Form -->

                        <!-- Form -->
                        <div class="row mb-4">
                            <label for="submitAppWebsite" class="col-sm-3 col-form-label form-label">비밀번호</label>
                            <div class="col-sm-9">
                                <p>****</p>
                            </div>
                        </div>
                        <!-- End Form -->

                        <!-- Form -->
                        <div class="row mb-4">
                            <label for="submitAppWebsite" class="col-sm-3 col-form-label form-label">조회수</label>
                            <div class="col-sm-9">
                                <p>5</p>
                            </div>
                        </div>
                        <!-- End Form -->
                        
                        <!-- Form -->
                        <div class="row mb-4">
                            <label for="submitAppWebsite" class="col-sm-3 col-form-label form-label">지역</label>
                            <div class="col-sm-9">
                                <p>서울시</p>
                            </div>
                        </div>
                        <!-- End Form -->

                        <!-- Form -->
                        <div class="row mb-4">
                            <label for="submitAppWebsite" class="col-sm-3 col-form-label form-label">첨부파일</label>
                            <div class="col-sm-9">
                                <a href="javascript:fileDownload('', '');">
                                    <img src="" width="20" height="20" />

                                </a>
                            </div>
                        </div>
                        <!-- End Form -->

                        <!-- Form-->
                        <div class="row mb-4">
                            <label class="col-sm-3 col-form-label form-label">내용</label>

                            <div class="col-sm-9">
                                <!-- Quill -->
                                <div style="height: 15rem; border: 1px solid rgba(133, 132, 132, 0.76);">
                                    <p>내용</p>
                                </div>
                                <!-- End Quill -->
                            </div>
                        </div>
                        <!-- End Form-->

                        <div class="text-center mt-5">
                            <button type="submit me-3" class="btn btn-primary btn-lg">목록으로</button>
                            <button type="submit me-3" class="btn btn-primary btn-lg">수정</button>
                            <button type="submit ms-3" class="btn btn-primary btn-lg">삭제</button>
                        </div>
                    </form>
                    <!-- End Form -->
                </div>
            </div>
            <!-- End Card -->
        </div>
    </div>

    <!-- JS Implementing Plugins -->
    <script src="assets/vendor/hs-file-attach/dist/hs-file-attach.min.js"></script>
    <script src="assets/vendor/hs-count-characters/dist/js/hs-count-characters.js"></script>
    <script src="assets/vendor/quill/dist/quill.min.js"></script>
    <script src="assets/vendor/dropzone/dist/min/dropzone.min.js"></script>

    <!-- JS Front -->

    <!-- JS Plugins Init. -->
    <script>
        (function() {
            // INITIALIZATION OF FILE ATTACH
            // =======================================================
            new HSFileAttach('.js-file-attach')


            // INITIALIZATION OF COUNT CHARACTERS
            // =======================================================
            new HSCountCharacters('.js-count-characters')


            // INITIALIZATION OF QUILLJS EDITOR
            // =======================================================
            HSCore.components.HSQuill.init('.js-quill')


            // INITIALIZATION OF DROPZONE
            // =======================================================
            HSCore.components.HSDropzone.init('.js-dropzone')
        })()
    </script>

    <!-- End Form Card -->


    <!-- END CONTENTS-->
    
    


<%@ include file="../footer.jsp" %>