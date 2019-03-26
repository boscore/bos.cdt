add_custom_command( TARGET EosioClang POST_BUILD COMMAND mkdir -p ${CMAKE_BINARY_DIR}/bin )
macro( eosio_clang_install file )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/eosio_llvm/bin)
   add_custom_command( TARGET EosioClang POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CMAKE_INSTALL_FULL_BINDIR}
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
endmacro( eosio_clang_install )

macro( eosio_clang_install_and_symlink file symlink )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/eosio_llvm/bin)
   add_custom_command( TARGET EosioClang POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   add_custom_command( TARGET EosioClang POST_BUILD COMMAND cd ${CMAKE_BINARY_DIR}/bin && ln -sf ${file} ${symlink} )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CMAKE_INSTALL_FULL_BINDIR}
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
endmacro( eosio_clang_install_and_symlink )

macro( eosio_tool_install file )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/tools/bin)
   add_custom_command( TARGET EosioTools POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CMAKE_INSTALL_FULL_BINDIR}
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
endmacro( eosio_tool_install )

macro( eosio_tool_install_and_symlink file symlink )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/tools/bin)
   add_custom_command( TARGET EosioTools POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   add_custom_command( TARGET EosioTools POST_BUILD COMMAND cd ${CMAKE_BINARY_DIR}/bin && ln -sf ${file} ${symlink} )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CMAKE_INSTALL_FULL_BINDIR}
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
endmacro( eosio_tool_install_and_symlink )

macro( eosio_libraries_install)
   execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/lib)
   execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/include)
<<<<<<< HEAD:modules/InstallCDT.cmake
=======
   set(BIN_DIR ${CMAKE_BINARY_DIR}/EosioWasmLibraries-prefix/src/EosioWasmLibraries-build/)
>>>>>>> develop:modules/InstallCDT.cmake
   install(DIRECTORY ${CMAKE_BINARY_DIR}/lib/ DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)
   install(DIRECTORY ${CMAKE_BINARY_DIR}/include/ DESTINATION ${CMAKE_INSTALL_FULL_INCLUDEDIR})
endmacro( eosio_libraries_install )

eosio_clang_install_and_symlink(llvm-ranlib eosio-ranlib)
eosio_clang_install_and_symlink(llvm-ar eosio-ar)
eosio_clang_install_and_symlink(llvm-nm eosio-nm)
eosio_clang_install_and_symlink(llvm-objcopy eosio-objcopy)
eosio_clang_install_and_symlink(llvm-objdump eosio-objdump)
eosio_clang_install_and_symlink(llvm-readobj eosio-readobj)
eosio_clang_install_and_symlink(llvm-readelf eosio-readelf)
eosio_clang_install_and_symlink(llvm-strip eosio-strip)
eosio_clang_install(opt)
eosio_clang_install(llc)
eosio_clang_install(lld)
eosio_clang_install(ld.lld)
eosio_clang_install(ld64.lld)
eosio_clang_install(clang-7)
eosio_clang_install(wasm-ld)
eosio_tool_install(eosio-pp)
eosio_tool_install(eosio-wast2wasm)
eosio_tool_install(eosio-wasm2wast)
eosio_tool_install(eosio-cc)
eosio_tool_install(eosio-cpp)
eosio_tool_install(eosio-ld)
eosio_tool_install(eosio-abigen)
eosio_tool_install(eosio-abidiff)
eosio_tool_install(eosio-init)
eosio_clang_install(../lib/LLVMEosioApply${CMAKE_SHARED_LIBRARY_SUFFIX})
eosio_clang_install(../lib/LLVMEosioSoftfloat${CMAKE_SHARED_LIBRARY_SUFFIX})
eosio_clang_install(../lib/eosio_plugin${CMAKE_SHARED_LIBRARY_SUFFIX})
eosio_libraries_install()
